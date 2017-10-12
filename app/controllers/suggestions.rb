get "/suggestions" do
  redirect "/"
end

get "/suggestions/new" do
  current_user
  redirect '/' unless authorized?(current_user)
  erb :"suggestions/new"
end

post "/suggestions" do
  current_user
  redirect '/' unless authorized?(current_user)
  @new_suggestion = Suggestion.new(user_id: current_user.id, title: params[:suggestion][:title], body: params[:suggestion][:body])
  if @new_suggestion.save
    redirect "/"
  else
    @errors = @new_suggestion.errors.full_messages
    erb :"suggestions/new"
  end
end

# Why does this route have to be below "/suggestions/new" to work
get "/suggestions/:id" do
  @user = current_user
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/show"
end

get "/suggestions/:id/edit" do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/edit"
end

put "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  redirect "/" unless own_suggetion?(@suggestion)
  @suggestion.assign_attributes(params[:suggestion])
  if @suggestion.save
    redirect "/"
  else
    @errors = @suggestion.errors.full_messages
    erb :'suggestions/edit'
  end
end

delete "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  redirect "/" unless own_suggetion?(@suggestion)
  @suggestion_up_votes = @suggestion.up_votes
  @suggestion_up_votes.each do |up_vote|
    up_vote.destroy!
  end
  @suggestion.destroy!
  redirect "/"
end

#############################################################################

post "/suggestions/:id/upvote" do
  if logged_in?
    @suggestion = Suggestion.find(params[:id])
    @up_vote = @suggestion.up_votes.create(user_id: current_user.id, suggestion_id: params[:id])
    if @up_vote.save
      redirect "/suggestions/#{@suggestion.id}"
    else
      # Check into errors here
      redirect '/'
    end
  end
end

#This method needs to be addjusted in order to figure out how to grab the id of the Upvote to then have it be deleted, had it printing on the web browser just not firing
delete "/suggestions/:id/upvote" do
  current_user
  @suggestion = Suggestion.find_by(id: params[:id])
  # redirect "/" unless own_suggetion?(@suggestion)
  @up_vote = UpVote.find(suggestion_id: params[:id], user_id: current_user.id)
  if @up_vote
    @up_vote.destroy!
  end
  redirect "/users/#{current_user.id}"
end
