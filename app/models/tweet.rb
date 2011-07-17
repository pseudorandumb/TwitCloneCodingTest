class Tweet < ActiveRecord::Base
  #is_default 'ASCE, created_at'

  belongs_to :user
end
