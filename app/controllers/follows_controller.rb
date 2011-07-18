class FollowsController < ApplicationController
  def new
    #self.create
    @follow= Follow.new
  end

  def create
    @follow = current_user.followings.build(params[:follow]) #current_user.followers.build(params[:follow])
    if @follow.save!
      #logger.debug("test")
      redirect_to(root_url, :notice => 'User followed!')
    else
      render :text => "FAIL"
    end
  end

  def destroy
    @follow = current_user.followings.find_by_follow_id(params[:id]) #Follow.find(params[:id])
    @follow.destroy
  end

end
