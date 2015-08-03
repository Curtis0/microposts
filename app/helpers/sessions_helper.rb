module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) #When the current_user == nil, find the user id using the id in the session[:user_id], which was put there during the create.
  end # Using the ||= is very helpful. It saves memory and hence work for the computer. Rather than accessing the database (the right side), if the user is logged in, it can just grab the info from there (the left side), saving the hassle of running to access the DB.
# Also note to self. Methods, if they end on an assignment value/code, they will return the left variable, in this case the @current_user.
  
  def logged_in?
    !!current_user #Simply a double negative method. WHen current_user has an id, it returns true. When nil, it returns false.
  end
  
  def store_location
    session[:forwarding_url] = request.url if request.get? #Determines whether user/requestor is signed in each time they hit a new url that requires a signed in condition.
  end
  
end

# This helper module is accessed by the "parent" or 'application' controller, thereby allowing it to be accessed by all pages and functions and requests to this service/website.