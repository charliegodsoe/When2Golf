class CreateCoursesTimeDisplayFormatsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :courses_time_display_formats, :id => false do |t|
      t.references :course
      t.references :time_display_format
    end
        # 
        # time_display_format = TimeDisplayFormat.find(1)
        # Course.find(:all).each do |c|
        #   c.time_display_formats << @time_display_format
        # end
  end

  def self.down
    drop_table :courses_time_display_formats
  end
end
