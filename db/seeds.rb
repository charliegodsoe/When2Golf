# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

admin_role = UserRole.create :role => "Administrator", :description => "Manages website, can create Owners, and perform Owner operations."
owner_role = UserRole.create :role => "Owner", :description => "Manages courses and course information along with Publishers"
publisher_role = UserRole.create :role => "Publisher", :description => "Manages course content and tee time availablity information"

User.create(:email => "admin@admin.com", :name => "Admin", :user_role => admin_role, :password => "pinhead", :password_confirmation => "pinhead")
owner = User.create(:email => "owner@owner.com", :name => "Owner", :user_role => owner_role, :password => "pinhead", :password_confirmation => "pinhead")
User.create(:email => "publisher@publisher.com", :name => "Publisher", :user_role => publisher_role, :password => "pinhead", :password_confirmation => "pinhead")
charlie = User.create :email => "l", :name => "Charlie Godsoe", :user_role => owner_role, :password => "pinhead", :password_confirmation => "pinhead"

TimeDisplayType.create :type_name => "Monthly", :type_description => "Monthly view for tee times"
TimeDisplayType.create :type_name => "Weekly", :type_description => "Weekly view for tee times"
TimeDisplayType.create :type_name => "Daily", :type_description => "Daily view for tee times"

TimeDisplayFormat.create :format_name => "Standard Golf - Weekly", :time_display_type_id => 2

TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Early Morning", :group_display_name => "EM", :start_time =>  Time.parse("4:00"), :end_time =>  Time.parse("8:00") 
TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Morning", :group_display_name => "M", :start_time =>  Time.parse("8:00"), :end_time =>  Time.parse("12:00")
TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Afternoon", :group_display_name => "A", :start_time =>  Time.parse("12:00"), :end_time =>  Time.parse("17:00")
TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Evening", :group_display_name => "EV", :start_time =>  Time.parse("17:00"), :end_time =>  Time.parse("23:00")         
TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Twilight", :group_display_name => "T", :start_time =>  Time.parse("23:00"), :end_time =>  Time.parse("4:00")

owner.courses << Course.create(:name => "Valley Ridge Golf", :description => "A mere 15 minutes from downtown Calgary, Valley Ridge Golf Club feels as though it's worlds away from the hustle of city life", :location => "NW Calgary")
owner.courses << Course.create(:name => "RCGA Golf Centre", :description => "The RCGA Golf Centre is open to the public and provides a variety of quality golf products, services and programs targeted to families and golfers of all age groups and skill levels.", :location => "SE Calgary")
owner.courses << Course.create(:name => "Calgary Elks Lodge & Golf Club", :description => "The Elks is a beautiful oasis conveniently located just northwest of the junction of Deerfoot Trail and the Trans Canada Highway in the center of Calgary.",  :location => "NE Calgary")

charlie.courses << Course.create(:name => "Country Hills Golf Club", :description => "The two course development provides two distinctively different and exciting golf experiences. ",  :location => "NE Calgary")
charlie.courses << Course.create(:name => "Shaganappi Point Golf Course", :description => "he Front 9 is beautiful and fun to play.  A great job was done in adding trees, rocks, etc.  The rolling greens are a nice addition as are the paved pathways.",  :location => "SW Calgary")
charlie.courses << Course.create(:name => "Silver Springs Golf & Country Club", :description => "Imagine the traditions of a premier golf club only fifteen minutes from the heart of downtown. A place where deer, coyotes, hawks and owls still call home.",  :location => "NW Calgary")

time_display_format = TimeDisplayFormat.find(1)
Course.find(:all).each do |c|
  c.time_display_formats << time_display_format
end