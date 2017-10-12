get '/suggestions' do
  @suggestions = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  erb :'suggestions/new'
end

post '/suggestions' do
  @suggestion = current_user.suggestions.create(params[:suggestion])
  redirect '/suggestions'
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  erb :'suggestions/show'
end
