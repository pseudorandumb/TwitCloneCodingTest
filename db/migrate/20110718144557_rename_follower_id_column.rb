class RenameFollowerIdColumn < ActiveRecord::Migration
  def self.up
    rename_column :follows, :follower_id, :follow_id
  end

  def self.down
    rename_column :follows, :follow_id, :follower_id
  end
end
