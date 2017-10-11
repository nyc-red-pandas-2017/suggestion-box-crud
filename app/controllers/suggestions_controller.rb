get '/' do
  redirect '/suggestions'
end

get "/suggestions" do
  @suggestions = Suggestion.all
  puts @suggestions
  erb :'suggestions/index'
end

