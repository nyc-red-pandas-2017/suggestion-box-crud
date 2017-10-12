get '/suggestions' do
  @suggestion = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :'suggestions/new'
end

post '/suggestions' do
  @suggestion = Suggestion.new(params[:suggestion])
  @suggestion.user = current_user
  if @suggestion.save
    redirect '/suggestions'
  else
    erb :'suggestions/new'
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  erb :'suggestions/show'
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find(params[:id])
  if session[:user_id] == @suggestion.user
    erb :'suggestions/edit'
  else
    erb :'suggestions/show'
  end
end

patch '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  @suggestion.update(params[:suggestion])

  if @suggestion.save
    redirect '/suggestions'
  else
    erb :'suggestions/edit'
  end
end

delete '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])

  @suggestion.destroy

  redirect '/suggestions'
end

post '/suggestions/:id/upvote' do
  @suggestion = Suggestion.find(params[:id])

  @suggestion.update_attribute(:votes, @suggestion[:votes] + 1)

  redirect '/suggestions'
end

post '/suggestions/:id/downvote' do
  @suggestion = Suggestion.find(params[:id])

  @suggestion.update_attribute(:votes, @suggestion[:votes] - 1)

  redirect '/suggestions'
end




