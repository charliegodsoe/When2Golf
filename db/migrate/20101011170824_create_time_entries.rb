class CreateTimeEntries < ActiveRecord::Migration
  def self.up
    create_table :time_entries do |t|
      t.references :course
      t.datetime :start_date_time
      t.datetime :end_date_time

      t.timestamps
    end
  end

  def self.down
    drop_table :time_entries
  end
end
