get '/comments' do
  @comments = Comment.all #define instance variable for view
  erb :'comments/index' #show all comments view (index)
end

get '/comments/new' do
  @comment = Comment.new
  erb :'comments/new' #show new comments view
end

post '/comments' do
  #user = User.find_by(id: @user_id)
  #@comment = user.comments.new(params[:comment])
   #binding.pry
   @comment = Comment.new(params[:comment])
   @comment.user = current_user
  if @comment.save
    redirect '/comments'
  else
    @errors = @comment.errors.full_messages
    erb :'comments/new'
  end
end


get '/comments/:id' do
  @comment = Comment.find(params[:id]) #define instance variable for view
  erb :'comments/show' #show single comment view
end

get '/comments/:id/edit' do
  @comment = Comment.find_by(id: params[:id])
  if @comment #define intstance variable for view
    erb :'comments/edit' #show edit comment view
  else
    erb :'comments/index'
  end
end

put '/comments/:id' do
  @comment = Comment.find_by(id: params[:id]) #define variable to edit

  if comment && comment.user.id == session[:user_id] #saves new comment or returns false if unsuccessful
    comment.update(params[:comment])
    redirect '/comments/#{comment.id}' #redirect back to comments index page
  else
    erb :'comments/edit' #show edit comment view again(potentially displaying errors)
  end
end

delete '/comments/:id' do
  @comment = Comment.find_by(id: params[:id]) #define comment to delete
  if @comment && comment.user.id == session[:user_id]
    comment.destroy #delete comment
    redirect '/comments' #redirect back to comments index page
  else
    "error"
  end
end


put "/comments/:id/thumbs_up" do
  comment = Comment.find(params[:id])
  comment.increment!(:thumbs_up)
  redirect "/comments/#{comment.id}"
end

put "/comments/:id/thumbs_down" do
  comment = Comment.find(params[:id])
  comment.decrement!(:thumbs_up)
  redirect "/comments/#{comment.id}"
end
