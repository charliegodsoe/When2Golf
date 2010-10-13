# == Schema Information
# Schema version: 20101011170824
#
# Table name: time_format_groups
#
#  id                     :integer         not null, primary key
#  time_display_format_id :integer
#  group_name             :string(255)
#  group_display_name     :string(255)
#  start_time             :time
#  end_time               :time
#  created_at             :datetime
#  updated_at             :datetime
#

class TimeFormatGroup < ActiveRecord::Base
  belongs_to :time_display_format
end
