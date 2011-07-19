class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  def index
    @tweets = Tweet.order('created_at DESC').all
  end

  def new
    @user=User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(root_url, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def home
    @user = User.find_by_username(params[:username])#current_user
    if @user.present?
    @unique_follow=Follow.find_by_user_id_and_follow_id(current_user.id,@user.id)
    f=Follow.find_all_by_user_id(@user.id)
    @following=User.find(f.collect { |u| u.follow_id })
    @tweet = Tweet.new #@user.tweets.build #Tweet.new #current_user.tweets.new #Tweet.new
    @tweets = Tweet.find_all_by_stream_id(@user.id) | Tweet.find_all_by_user_id(@user.id)  #Used to display Feed
      if current_user==@user
        x=@following.collect {|u| u.tweets}.flatten
        @tweets += x
      end
    @tweets.sort! { |a,b| b.created_at <=> a.created_at }
    else
      redirect_to root_url
    end
  end

  def edit
    @user = current_user#  User.find #(params[:id])
  end
  
  def destroy
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
