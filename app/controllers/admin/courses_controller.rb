class Admin::CoursesController < ApplicationController
  before_filter :authenticate#, :only => [:show, :edit, :update, :destroy]
  
  def authenticate 
    #redirect_to signin_path, :notice => "please sign in" unless signed_in?
    deny_access unless signed_in?
  end
  
  def add_tee_time
    @course = Course.find(params[:id])
    @time_format_group = TimeFormatGroup.find(params[:time_format_group_id]) 
    @day = Date.parse(params[:day])#.to_date
    @start_date_time = start_from_group_and_date(@time_format_group, @day)
    @end_date_time = start_from_group_and_date(@time_format_group, @day)
    
    @course.time_entries.create(:start_date_time => @start_date_time, :end_date_time => @end_date_time)
    redirect_to([:admin, @course])
    #redirect_to :controller => "admin/courses", :action => "show", :id => @course
  end
  
  # GET /courses
  # GET /courses.xml
  def index
    if current_user.is_admin?
      @courses = Course.all
    else
      @courses = current_user.courses
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @day = DateTime.now
    
    @course = Course.find(params[:id])
    @time_entries = @course.time_entries
    #ToDo: This should probably be pushed to the model (encapsulate 2 = 'weekly')
    @course_display = TimeDisplayFormat.find_by_time_display_type_id(2)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.xml
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        current_user.courses << @course
        format.html { redirect_to([:admin, @course], :notice => 'Course was successfully created.') }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.xml
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to([:admin, @course], :notice => 'Course was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(admin_courses_url) }
      format.xml  { head :ok }
    end
  end
end
