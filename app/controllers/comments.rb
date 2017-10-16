get '/suggestions/:id/comments/new' do
  erb :'comments/new'
end

post '/suggestions/:id/comments' do
  @comment = Comment.new(params[:comment])
  # binding.pry
  @suggestion = Suggestion.find(params[:id])
  @user = User.find(params[:user])
  @comment.user = current_user
  @comment.suggestion = @suggestion

  if @comment.save
    redirect '/suggestions'
  else
    "Adding the comment was unsuccessful, please try again"
  end
end

get '/comments/:id' do
  @comment = Comment.find(params[:id])
  erb :'comments/show'
end

get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :'/comments/edit'
end

patch '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.update(params[:comment])
  if @comment.save
    redirect '/suggestions'
  else
    erb :'comments/edit'
  end
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/suggestions'
end
