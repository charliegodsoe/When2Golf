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
end
