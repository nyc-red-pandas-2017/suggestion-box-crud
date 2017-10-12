get "/" do
  @suggestions = Suggestion.all
  @current_user

  erb :index
end
