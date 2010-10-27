class Admin::TimeDisplayFormatsController < ApplicationController
  
  before_filter :check_priviledges
  
  def check_priviledges
    deny_administrative_access unless has_admin_privileges? 
  end
  
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

end
