get "/" do
  @suggestions = Suggestion.all
#
  @current_user_
  erb :index
end
