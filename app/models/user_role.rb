# == Schema Information
# Schema version: 20100915234332
#
# Table name: user_roles
#
#  id          :integer         not null, primary key
#  role        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class UserRole < ActiveRecord::Base
end
