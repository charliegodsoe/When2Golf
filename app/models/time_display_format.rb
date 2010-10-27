# == Schema Information
# Schema version: 20101011170824
#
# Table name: time_display_formats
#
#  id                   :integer         not null, primary key
#  format_name          :string(255)
#  time_display_type_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class TimeDisplayFormat < ActiveRecord::Base
  belongs_to :time_display_type
  has_and_belongs_to_many :courses
  has_many :time_format_groups
  
  def format_role_and_description
    "#{time_display_type.type_name} - #{time_display_type.type_description}"
  end
end
