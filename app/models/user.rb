class User < ActiveRecord::Base
  acts_as_authentic do |c|
  #  c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  c.login_field :username
  end
  validates_uniqueness_of :username
  validates_presence_of :password, :email, :username
  
  has_many :followers, :class_name => 'Follows', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follows', :foreign_key => 'id'
end
