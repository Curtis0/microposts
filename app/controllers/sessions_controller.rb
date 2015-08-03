class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase) #This is to find the users information by searching for the same email address that was just put into the [:session][:email] in the form. We put the users informatino into @user to use to authenticate the password among other things later on.
    if @user && @user.authenticate(params[:session][:password]) #This is authenticate the password of the user found above matches the password just entered into the form.
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user #This redirects the page to the users information page.
    else
      flash[:danger] = "invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil #destroy or get rid of all the user information in both the browser and the server.
    redirect_to root_path
  end

end
