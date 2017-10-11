get '/suggestions' do
  @suggestions = Suggestion.all
  erb :'/suggestions/index'
end

get '/suggestions/new' do
  erb :'/suggestions/new'
end

post '/suggestions/new' do
  @suggestion = Suggestion.new(params[:suggestion])
  current_user = User.find(session[:id])
  @suggestion.user = current_user
  if @suggestion.save
    redirect '/suggestions'
  else
    erb :'/suggestions/new'
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  erb :'/suggestions/show'
end
