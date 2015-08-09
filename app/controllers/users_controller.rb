class UsersController < ApplicationController
before_action :set_before, only: [ :show, :edit, :update, :followers, :followees ]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(5)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!" #Here we use a hash (array?). We put the type of flash signal (or key) we want in the hash and add the message we want applied to that key into the corresponding value. We also need to code instructions for the flash to show in the application.html.erb file.
      redirect_to @user #Same as 'redirect_to user_path(@user)' where this '@user' is pointing to the '@user' in the show method.
    else                #We know it is pointing to the '@user' in the show method because 'user_path' is pointing to the
      render 'new'      #users(controller)#show(method). 'user_path' without other arguments is always a GET in the rake routes.
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "You're account has successfully been updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def set_before
    @user = User.find(params[:id])
  end
  
  def followers
    @followers = @user.follower_users # This is the same as @user.follower_users.all . '.all' is ONLY used to grab all elements of a CLASS.
  end
  
  def followees
    @followees = @user.following_users # By the way this followers_users and followees_users can be found defined in the user.rb model file.  
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :profile,
      :area,
      :password,
      :password_confirmation
      )
  end
  
end
