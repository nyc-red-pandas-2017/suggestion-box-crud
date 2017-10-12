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

def user_suggestion?(suggestion, user)
  suggestion.user == user
end

def already_up_voted?(suggestion, user)
  @suggestion_up_votes = suggestion.up_votes
  if @suggestion_up_votes.find_by(user_id: user.id)
    return true
  else
    false
  end
end
