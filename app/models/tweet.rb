class Tweet < ActiveRecord::Base
  validates_length_of :body, :in=>1..140, :too_long => "Tweet must be less than 141 character", :too_short => "Can't be blank"

  before_create :parse_tweet
  belongs_to :user
  def parse_tweet
    userToMsg=self.body.match('^@\S*')[0] if self.body.match('^@\S*')#self.body.match("^@\S*")
    if(userToMsg!=nil)
      userToMsg.delete! '@'
      user=User.find_by_username(userToMsg)
      self.stream_id=user.id unless user.blank?
    end
  end
end
