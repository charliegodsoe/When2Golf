# == Schema Information
# Schema version: 20101011170824
#
# Table name: time_entries
#
#  id              :integer         not null, primary key
#  course_id       :integer
#  start_date_time :datetime
#  end_date_time   :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

class TimeEntry < ActiveRecord::Base
  belongs_to :course
  
  def within?(time_format_group, date)
    start_time = DateTime.new(date.year, date.month, date.day, time_format_group.start_time.hour, time_format_group.start_time.min)
    if(time_format_group.end_time.hour < time_format_group.start_time.hour)    
      end_time = DateTime.new(date.year, date.month, date.day + 1, time_format_group.end_time.hour, time_format_group.end_time.min)
    else  
      end_time = DateTime.new(date.year, date.month, date.day, time_format_group.end_time.hour, time_format_group.end_time.min)
    end
    bool = start_date_time >= start_time and end_date_time < end_time
  end
end
