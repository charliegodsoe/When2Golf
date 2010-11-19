class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.xml
  def index
    @courses = Course.find(:all)
    #@courses = Course.find(:all, :select => 'distinct course_id', :order => 'time_entries.updated_at desc', :joins => 'left outer join time_entries ON time_entries.course_id = courses.id')
    #@course.time_entries.find(:all, :order => "updated_at", :limit => 1)
    @courses.sort! { |a,b| b.last_tee_time_update <=> a.last_tee_time_update } #find(:all, :order => "updated_at", :limit => 1).first.updated_at }
    @day = DateTime.now
    @time_entry_qualities = TimeEntryQuality.find(:all, :conditions => "display_name IS NOT NULL")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.xml
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.xml
  # def new
  #      @course = Course.new
  #   
  #      respond_to do |format|
  #        format.html # new.html.erb
  #        format.xml  { render :xml => @course }
  #      end
  #    end

  # GET /courses/1/edit
  # def edit
  #     @course = Course.find(params[:id])
  #   end

  # POST /courses
  # POST /courses.xml
  # def create
  #    @course = Course.new(params[:course])
  # 
  #    respond_to do |format|
  #      if @course.save
  #        format.html { redirect_to(@course, :notice => 'Course was successfully created.') }
  #        format.xml  { render :xml => @course, :status => :created, :location => @course }
  #      else
  #        format.html { render :action => "new" }
  #        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
  #      end
  #    end
  #  end

  # PUT /courses/1
  # PUT /courses/1.xml
  # def update
  #    @course = Course.find(params[:id])
  # 
  #    respond_to do |format|
  #      if @course.update_attributes(params[:course])
  #        format.html { redirect_to(@course, :notice => 'Course was successfully updated.') }
  #        format.xml  { head :ok }
  #      else
  #        format.html { render :action => "edit" }
  #        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
  #      end
  #    end
  #  end

  # DELETE /courses/1
  # DELETE /courses/1.xml
  # def destroy
  #     @course = Course.find(params[:id])
  #     @course.destroy
  # 
  #     respond_to do |format|
  #       format.html { redirect_to(courses_url) }
  #       format.xml  { head :ok }
  #     end
  #   end
end
