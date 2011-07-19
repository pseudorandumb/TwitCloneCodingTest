class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(params[:tweet])
    if @tweet.save
      redirect_to '/'+current_user.username
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to '/'+current_user.username
  end

end
