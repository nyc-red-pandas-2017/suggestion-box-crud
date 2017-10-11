get '/suggestions' do
  @suggestions = Suggestion.all
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

post '/suggestions/:id/upvote' do
  @vote = Vote.new(vote: true)
  @votes = Vote.where(id: params[:suggestion_id])
  @suggestion = Suggestion.find(params[:id])
  if @vote.save
    redirect '/suggestions/#{params[:suggestion_id]}'
  else
    @errors = "Error"
    erb :"/suggestions/show"
  end
end

post '/suggestions/:id/downvote' do
  @vote = Vote.new(vote: false)
  @votes = Vote.where(id: params[:suggestion_id])
  @suggestion = Suggestion.find(params[:id])
  if @vote.save
    redirect '/suggestions/#{params[:suggestion_id]}'
  else
    @errors = "Error"
    erb :"/suggestions/show"
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  erb :'/suggestions/show'
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find(params[:id])
  erb :'/suggestions/edit'
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
  @suggestion.destroy
  redirect '/suggestions'
end
