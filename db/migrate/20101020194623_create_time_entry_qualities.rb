class CreateTimeEntryQualities < ActiveRecord::Migration
  def self.up
    create_table :time_entry_qualities do |t|
      t.string :name
      t.text :description
      t.integer :time_in_minutes

      t.timestamps
    end
  end

  def self.down
    drop_table :time_entry_qualities
  end
end
