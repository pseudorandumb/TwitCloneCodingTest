class FollowsController < ApplicationController
  def new
    @follow= Follow.new
  end

  def create
    @follow = Follow.new(params[:follow])
    if @follow.save!
      redirect_to :back
    else
      render :text => "FAIL"
    end
  end

  def destroy
    @follow = Follow.find(params[:id]) #current_user.followings.find_by_follow_id(params[:id]) #Follow.find(params[:id])
    @follow.destroy
    redirect_to :back
  end

end
