post '/comments' do
  @comment = Comment.new( comment_text: params[:comment_text],
               user_id: current_user.id, commentable_id: params[:thing_id], commentable_type: params[:commentable_type])
  if @comment.save
    redirect "/suggestions/#{params[:suggestion_id]}"
  else
    @errors = "Nope, try again."
    erb :"/suggestions/show"
  end
end

delete '/comments/:id' do
  comment = Comment.find_by(id: params[:id])
  comment.destroy!
  redirect "/suggestions/#{params[:suggestion_id]}"
end