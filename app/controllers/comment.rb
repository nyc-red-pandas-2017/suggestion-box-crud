get '/comments/new' do
  @comment = Comment.new
  erb :'comments/new'
end

post '/suggestions/:suggestion_id/comments/new' do
  @suggestion = Suggestion.find_by(id: params[:suggestion_id])
  @comment = @suggestion.comments.new(user: current_user, body: params[:body])
  if @comment.save
    redirect "/suggestions"
  else
    "Errors"
  erb :'suggestions/show'
  end
end

get '/comments/:id' do
  @comment = Comment.find_by(id: params[:comment_id]) #define instance variable for view
  erb :'comments/show' #show single comment view
end

get '/comments/:id/edit' do
  @comment = Comment.find_by(id: params[:id])
  if @comment #define intstance variable for view
    erb :'comments/edit' #show edit comment view
  else
    redirect "/suggestions"
  end
end

put '/comments/:id' do
  @comment = Comment.find_by(id: params[:id]) #define variable to edit

  if @comment && @comment.user.id == session[:user_id] #saves new comment or returns false if unsuccessful
    @comment.update(params[:comment])
    redirect "/suggestions" #redirect back to comments index page
  else
    puts "Error"
    erb :'comments/edit' #show edit comment view again(potentially displaying errors)
  end
end

delete '/comments/:id' do
  @comment = Comment.find_by(id: params[:id]) #define comment to delete
  if @comment && @comment.user.id == session[:user_id]
    @comment.destroy #delete comment
    redirect "/suggestions"#redirect back to comments index page
  else
    "error"
  end
end

