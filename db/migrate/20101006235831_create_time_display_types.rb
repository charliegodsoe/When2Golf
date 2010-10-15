class CreateTimeDisplayTypes < ActiveRecord::Migration
  def self.up
    create_table :time_display_types do |t|
      t.string :type_name
      t.string :type_description

      t.timestamps
    end
    
    # TimeDisplayType.create :type_name => "Monthly", :type_description => "Monthly view for tee times"
    #     TimeDisplayType.create :type_name => "Weekly", :type_description => "Weekly view for tee times"
    #     TimeDisplayType.create :type_name => "Daily", :type_description => "Daily view for tee times"
  end

  def self.down
    drop_table :time_display_types
  end
end
