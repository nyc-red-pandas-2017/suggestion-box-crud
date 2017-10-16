get '/' do
  @suggestions = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :'suggestions/new'
end

post '/suggestions' do
  current_user
  @suggestion = Suggestion.new(user_id: current_user.id, title: params[:title], description: params[:description])
  if @suggestion.save
    redirect '/'
  else
    @errors = @suggestion.errors.full_messages
    erb :'suggestion/new'
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :'suggestions/show'
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :'suggestions/edit'
end

put '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  if own_suggestion?
    @suggestion.assign_attributes(params[:title],params[:suggestion])
    if @suggestion.save
      redirect "/"
    else
      @errors = @suggestion.errors.full_messages
      erb :'suggestion/edit'
    end
  else
      @errors = "Not your suggestion to update"
      erb :'/index'
  end

end

delete "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  if own_suggestion?
    @suggestion.destroy!
    redirect "/"
  else
    @errors = "Not your suggestion to delete"
    erb :'/'
  end
end
