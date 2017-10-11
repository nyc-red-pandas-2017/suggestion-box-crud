def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def owns_suggestion(suggestion)
  logged_in? && suggestion.user == current_user
end
