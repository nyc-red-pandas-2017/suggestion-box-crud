get "/" do
  @suggestions = Suggestion.all
  erb :index
end
