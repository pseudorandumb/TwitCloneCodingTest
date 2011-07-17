class UsersController < ApplicationController
  def index
    @users = User.all #find(params[:id])
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end
  before_filter :authenticate
  
  def home
    User.find_by_username(params[:username])
  end

  def edit
    @user = User.find(params[:id])
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
  
  protected
  def authenticate
    
  end
end
