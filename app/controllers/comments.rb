post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect '/suggestions'
  else
    erb :'/comments/_comment'
  end
end

