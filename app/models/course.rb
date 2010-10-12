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
  
  def tee_times(time_format_group, date)
    count = 0
    time_entries.each do |time_entry|
      count += 1 if time_entry.within?(time_format_group, date)
    end
    return count
  end
end
