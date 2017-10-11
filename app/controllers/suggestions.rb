get '/suggestions' do
  @suggestions = Suggestion.all
  # @suggestion = Suggestion.find_by(id: )
  @user = User.find(session[:id])
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

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find(params[:id])
  if @suggestion.user == current_user
    erb :'/suggestions/edit'
  else
    @error = "You are not authorized to edit this."
  end
end

put '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  @suggestion.assign_attributes(params[:suggestion])
  if @suggestion.save
    redirect '/suggestions'
  else
    erb :'/suggestions/edit'
  end
end

delete '/suggestions/:id' do
    @suggestion = Suggestion.find(params[:id])
    if @suggestion.user == current_user
    @suggestion.destroy
    redirect '/suggestions'
  else
    @error = "You are not authorized to delete this."
  end
end

post '/suggestions/:id/upvote' do
  @suggestion = Suggestion.find(params[:id])
  @suggestion.votes.new(vote: true, user_id: current_user.id)
  if @suggestion.save
    redirect '/suggestions'
  else
    @errors = "Error"
    erb :"/suggestions/show"
  end
end


