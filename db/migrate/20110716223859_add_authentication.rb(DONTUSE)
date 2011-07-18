class AddAuthentication < ActiveRecord::Migration
  def self.up
    add_column :users, :password_salt, :string, :null => false
    add_column :users, :persistence_token, :string, :null => false
  end

  def self.down
    remove_column :users, :password_salt, :string
    remove_column :users, :persistence_token, :string
  end
end
