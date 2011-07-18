class FollowsController < ApplicationController
  def new
    #self.create
    @follow= Follow.new
  end

  def create
    @follow = current_user.followers.build(params[:follow])   #Follow.new(params[:follow])
    if @follow.save!
      logger.debug("test")
      redirect_to(root_url, :notice => 'User followed!')
    else
      render :text => "FAIL"
    end
  end

  def destroy
  end

end
