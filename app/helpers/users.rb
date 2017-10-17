def current_user
  @current_user ||= User.find_by(id: session[:user_id])
  # @current_user = User.

end

def logged_in?
  !!current_user
  # true
end

def require_user
  redirect '/users/new' unless logged_in?
end
