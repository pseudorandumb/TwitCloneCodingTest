class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    if @tweet.save
         #redirect_to(user_path, :notice => 'User was successfully created.')
         redirect_to root_url
         puts "saved"
      else
        #render :action => "new"
        puts "bleh"
      end
    #redirect_to root_url
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end

end
