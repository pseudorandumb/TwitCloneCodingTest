class User < ActiveRecord::Base
  acts_as_authentic do |c|
  c.login_field = :username
  end
  validates_uniqueness_of :username, :email
  validates_presence_of :password, :email, :username
  has_many :tweets
  has_many :followers, :class_name => 'Follow', :foreign_key => 'user_id'    #'follow_id'
  has_many :followings, :class_name => 'Follow', :foreign_key => 'follow_id' #'user_id'
  #Avatar stuff:
  has_attached_file :avatar
  validates_attachment_size :avatar, :less_than => 3.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/bmp']
end

