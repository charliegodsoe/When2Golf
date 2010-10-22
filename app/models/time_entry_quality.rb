# == Schema Information
# Schema version: 20101020194623
#
# Table name: time_entry_qualities
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  description     :text
#  time_in_minutes :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class TimeEntryQuality < ActiveRecord::Base
end
