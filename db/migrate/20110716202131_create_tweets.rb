class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :body
      t.integer :user_id
      t.integer :stream_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
