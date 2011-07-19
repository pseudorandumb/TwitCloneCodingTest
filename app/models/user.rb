class User < ActiveRecord::Base
  acts_as_authentic do |c|
  #  c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  c.login_field = :username
  #c.merge_validates_uniqueness_of_login_field_options
  #c.validates_format_of_email_field_options=true
  end
  validates_uniqueness_of :username, :email
  validates_presence_of :password, :email, :username
  has_many :tweets
  #########accepts_nested_attributes_for :tweets # , :following
  has_many :followers, :class_name => 'Follow', :foreign_key => 'user_id'    #'follow_id'
  has_many :followings, :class_name => 'Follow', :foreign_key => 'follow_id' #'user_id'
end

