class CreateUserRoles < ActiveRecord::Migration
  def self.up
    create_table :user_roles do |t|
      t.string :role
      t.string :description
      t.timestamps
    end
    
    UserRole.reset_column_information
    
    UserRole.create :role => "Administrator", :description => "Manages website, can create Owners, and perform Owner operations."
    UserRole.create :role => "Owner", :description => "Manages courses and course information along with Publishers"
    UserRole.create :role => "Publisher", :description => "Manages course content and tee time availablity information"
  end

  def self.down
    drop_table :user_roles
  end
  
  
end
