def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def own_suggestion?(suggestion)
  logged_in? && suggestion.user == current_user
  # FYI This also works
  # logged_in? && suggestion.user_id == current_user.id
end
