def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def authorized?(possible_user)
  logged_in? && current_user == possible_user
end

def own_suggetion?(suggestion)
  logged_in? && suggestion.user == current_user
end

# def user_tweet?(tweet, user)
#   tweet.user == user
# end
