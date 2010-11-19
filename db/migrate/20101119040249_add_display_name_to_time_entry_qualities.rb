class AddDisplayNameToTimeEntryQualities < ActiveRecord::Migration
  def self.up
    add_column :time_entry_qualities, :display_name, :string
  end

  def self.down
    remove_column :time_entry_qualities, :display_name
  end
end
