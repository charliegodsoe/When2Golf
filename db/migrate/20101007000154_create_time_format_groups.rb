class CreateTimeFormatGroups < ActiveRecord::Migration
  def self.up
    create_table :time_format_groups do |t|
      t.references :time_display_format 
      t.string :group_name
      t.string :group_display_name
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
       #  
       # TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Early Morning", :group_display_name => "EM", :start_time =>  Time.parse("4:00"), :end_time =>  Time.parse("8:00") 
       # TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Morning", :group_display_name => "M", :start_time =>  Time.parse("8:00"), :end_time =>  Time.parse("12:00")
       # TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Afternoon", :group_display_name => "A", :start_time =>  Time.parse("12:00"), :end_time =>  Time.parse("17:00")
       # TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Evening", :group_display_name => "EV", :start_time =>  Time.parse("17:00"), :end_time =>  Time.parse("23:00")         
       # TimeFormatGroup.create :time_display_format_id => 1, :group_name => "Twilight", :group_display_name => "T", :start_time =>  Time.parse("23:00"), :end_time =>  Time.parse("4:00")
       #                         

    
    
  end

  def self.down
    drop_table :time_format_groups
  end
end
