class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :name
      t.references :user_role, :default => 3
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
    
    User.create :email => "charliegodsoe@gmail.com", :name => "Charlie Godsoe", :user_role_id => 1, :password => "pinhead", :password_confirmation => "pinhead"
  end

  def self.down
    drop_table :users
  end
end
