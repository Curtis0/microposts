class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
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


  
  private
  
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
      )
  end
end
