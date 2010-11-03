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
  accepts_nested_attributes_for :time_format_groups, :allow_destroy => true
  
  def format_role_and_description
    "#{time_display_type.type_name} - #{time_display_type.type_description}"
  end
  
  # def time_format_groups_attributes=(attributes)
  #       attributes.each do |attribute|
  #         time_format_groups.build(attribute)
  #       end
  #   end
end
