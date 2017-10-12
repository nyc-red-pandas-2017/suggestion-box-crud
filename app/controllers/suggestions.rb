get '/suggestions' do
  @suggestions = Suggestion.joins(:votes).group("votes.id").order("count(votes.id) desc")
  erb :'suggestions/index'
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :'suggestions/new'
end

post '/suggestions' do
  @suggestion = current_user.suggestions.create(params[:suggestion])
  redirect '/suggestions'
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :'suggestions/show'
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find_by(id: params[:id])
  if current_user == @suggestion.user
    erb :'suggestions/edit'
  else
    status 401
    redirect "/suggestions/#{@suggestion.id}"
  end
end

patch '/suggestions/:id' do
  puts params
  @suggestion = Suggestion.find_by(id: params[:id])
  @suggestion.update(params[:suggestion])
  redirect "/suggestions"
end

delete '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  if current_user == @suggestion.user
    Suggestion.find(params[:id]).destroy!
    redirect '/suggestions/:id'
  else
    status 401
    redirect '/suggestions/:id'
  end
end

post '/suggestions/:id/vote' do
  @suggestion = Suggestion.find_by(id: params[:id])
  unless @suggestion.votes.find {|vote| vote.user_id == current_user.id}
    @vote = Vote.new(vote: 1, votable_type: "Suggestion", votable_id: params[:suggestion_id], user_id: current_user.id)
    @votes = Vote.where(votable_id: params[:suggestion_id])
    if @vote.save
      redirect "/suggestions/#{params[:suggestion_id]}"
    else
      @errors = "Nope, try again."
      erb :"/suggestions/show"
    end
  end
  redirect "/suggestions/#{params[:id]}"
end

post '/suggestions/:id/downvote' do
  @suggestion = Suggestion.find_by(id: params[:id])
  @suggestion.votes.find do |vote|
    if vote.user_id == current_user.id
    vote.destroy
      redirect "/suggestions/#{params[:id]}"
    else
      redirect "/suggestions/#{params[:id]}"
    end
  end
end