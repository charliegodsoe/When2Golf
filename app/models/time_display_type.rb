# == Schema Information
# Schema version: 20101011170824
#
# Table name: time_display_types
#
#  id               :integer         not null, primary key
#  type_name        :string(255)
#  type_description :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class TimeDisplayType < ActiveRecord::Base
end
