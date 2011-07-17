class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(params[:tweet])
    if @tweet.save
         redirect_to(:back, :notice => 'User was successfully created.')
      else
         redirect_to root_url
      end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end

end
