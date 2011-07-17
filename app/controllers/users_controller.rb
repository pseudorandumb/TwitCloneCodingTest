class UsersController < ApplicationController
  helper UsersHelper
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :home]
  def index
    @users = User.all #find(params[:id])
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def home
    #@tweets=current_user.tweets.all
    @user = User.find_by_username(params[:username])#current_user
    @tweet = Tweet.new #@user.tweets.build #Tweet.new #current_user.tweets.new #Tweet.new
    @tweets = @user.tweets.order('created_at DESC').all
    #redirect_to @user
  end

  def edit
    @user = current_user#  User.find #(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
      if @user.save
         redirect_to(@user, :notice => 'User was successfully created.')
      else
        render :action => "new"
      end
  end
  
  def destory
    @user = User.find(params[:id])
    @user.destroy
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
