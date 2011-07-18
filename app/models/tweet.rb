class Tweet < ActiveRecord::Base
  #is_default 'ASCE, created_at'
  before_create :parse_tweet
  belongs_to :user
  def parse_tweet
    #userToMsg=String.new(self.body.match("^@\S*").to_s) #@ chars SPACE \s #####"^@\S*"
    userToMsg=self.body.match('^@\S*')[0] #self.body.match("^@\S*")
    #breakpointer
    #puts "TEST DATA HERE:"
    #puts userToMsg
    #puts userToMsg.to_s

    if(userToMsg!=nil)
      #userToMsg.to_s.sub '@', ''
      userToMsg.delete! '@'
      #puts userToMsg
      ##self.body=userToMsg
      user=User.find_by_username(userToMsg)
      #puts user.id, user.name, user
      self.stream_id=user.id unless user.blank?
    end
  end
end
