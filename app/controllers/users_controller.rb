class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]) 
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
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
