class Admin::TimeDisplayFormatsController < ApplicationController
  
  before_filter :check_priviledges
  
  def check_priviledges
    deny_administrative_access unless has_admin_privileges? 
  end
  
  def index
    @time_display_formats = TimeDisplayFormat.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_display_formats }
    end
  end

  def show
    @time_display_format = TimeDisplayFormat.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_display_format }
    end
  end

  def new
    @time_display_format = TimeDisplayFormat.new
    # 3.times { @time_display_format.time_format_groups.build }
    @time_display_format.time_format_groups.build
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_display_format }
    end
  end

  def create
    @time_display_format = TimeDisplayFormat.new(params[:time_display_format])

    respond_to do |format|
      if @time_display_format.save
        format.html { redirect_to([:admin, @time_display_format], :notice => 'Display format successfully created.') }
        #format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

end
