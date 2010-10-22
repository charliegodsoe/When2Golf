# == Schema Information
# Schema version: 20100915234332
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  location    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :time_display_formats
  has_many :time_entries
  
  def last_tee_time_update
    tee_time = time_entries.find(:all, :order => "updated_at desc").first
    return tee_time.updated_at unless tee_time.nil?
    return DateTime.new
  end
  
  def tee_times(time_format_group, date)
    count = 0
    time_entries.each do |time_entry|
      count += 1 if time_entry.within?(time_format_group, date)
    end
    return count
  end
  
  def cell_quality(time_format_group, date)
    highest_date = DateTime.new
    count = 0
    time_entries.each do |time_entry|
      highest_date = time_entry.updated_at if time_entry.within?(time_format_group, date) and time_entry.updated_at > highest_date
      count += 1 if time_entry.within?(time_format_group, date)
    end
    highest_date
    if count > 0
      minutes = ((DateTime.now.to_f - highest_date.to_f) / 60).round.to_i
      TimeEntryQuality.find(:all, :order => 'id asc',:conditions => ['time_in_minutes > ?', minutes]).first.name
    else
      TimeEntryQuality.find_by_time_in_minutes(nil).name
    end
  end
end
