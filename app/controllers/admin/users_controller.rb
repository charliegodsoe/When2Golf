class Admin::UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:show, :edit, :update, :destroy]
  
  def authenticate 
    #redirect_to signin_path, :notice => "please sign in" unless signed_in?
    deny_access unless signed_in?
  end
  
  
  def save
    if current_user.has_owner_privileges?
      logger.debug "Made it to 'save'"
      logger.debug params.inspect
      @user = User.find(params[:id])
      @course = Course.find(params[:course])
      if params[:show] == "true"
        @user.courses << @course
      else
        @user.courses.delete(@course)
      end
      @user.save!
      render :nothing => true
    end
  end
  
  
  # GET /users
  # GET /users.xml
  def index
    if current_user.is_admin?
      @users = User.all
    else
      @users = User.find_all_by_user_role_id(3)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @user_role = UserRole.find(@user.user_role_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to([:admin, @user], :notice => 'User was successfully created.') }
        #format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to([:admin, @user], :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end
end