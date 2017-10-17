get '/suggestions' do
  @suggestions = Suggestion.all
  @sorted_suggestions = @suggestions.sort_by{|suggestion| suggestion.votes.count}.reverse
  @user = User.find(session[:id])

  erb :'/suggestions/index'
end

get '/suggestions/new' do
  erb :'/suggestions/new'
end

post '/suggestions' do
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
  if @suggestion.votes.find_by(user_id: current_user.id)
    @error = "You can't vote twice."
  else
  @suggestion.votes.new(vote: true, user: current_user)
  if @suggestion.save
    redirect '/suggestions'
  else
    @errors = "Error"
    erb :"/suggestions/show"
  end
end
end

post '/suggestions/:id/undo' do
  @suggestion = Suggestion.find(params[:id])
  if @suggestion.votes.find_by(user_id: current_user.id)
    @suggestion.votes.find_by(user: current_user).destroy
    redirect '/suggestions'
  else
    @error = "Error"
  end
end

post '/suggestions/:id/comments' do
  @suggestion = Suggestion.find(params[:id])
  new_comment = @suggestion.comments.new(text: params[:comment][:text], user_id: current_user.id)
  # binding.pry
  if new_comment.save
    redirect '/suggestions'
  else
    @errors ="Error"
    erb :'/suggestions/index'
  end
end

get '/suggestions/:id/comments/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  # binding.pry
   @suggestion = Suggestion.find(params[:id])
   if @comment.user == current_user
  @current_comment = @suggestion.comments.find_by(suggestion_id: @suggestion.id)
    erb :'/comments/edit'
  else
    @error = "You cannot edit this."
  end
end

put '/suggestions/:id/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @suggestion = Suggestion.find(params[:id])
  if @comment.user == current_user
    @comment.assign_attributes(params[:comment])
    if @comment.save
      redirect '/suggestions'
    else
      @suggestions = Suggestion.all
      @sorted_suggestions = @suggestions.sort_by{|suggestion| suggestion.votes.count}.reverse
      @user = User.find(session[:id])
      @error = "Error"
      erb :'/suggestions/index'
    end
  else
    "Error"
  end
end

delete '/suggestions/:id/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @suggestion = Suggestion.find(params[:id])
  if @comment.user == current_user
    @comment.destroy
    redirect '/suggestions'
  else
    @error = "You are not authorized to delete this."
  end
end







