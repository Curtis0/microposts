class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
  def logged_in_user #thie method redirects any users/requestors who are not signed in to the sign in page. This along with the SessionsHelper module forces users to sign in before being allowed to access any pages with this condition attached.
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
