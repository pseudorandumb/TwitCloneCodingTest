class FollowController < ApplicationController
  def new
    @follow= Follow.new
  end

  def create
    @follow = Follow.new(params[:follow])
  end

  def destroy
  end

end
