class CreateTimeDisplayFormats < ActiveRecord::Migration
  def self.up
    create_table :time_display_formats do |t|
      t.string :format_name
      t.references :time_display_type
      t.timestamps
    end
    
    # TimeDisplayFormat.create :format_name => "Standard Golf - Weekly", :time_display_type_id => 2
  end

  def self.down
    drop_table :time_display_formats
  end
end
