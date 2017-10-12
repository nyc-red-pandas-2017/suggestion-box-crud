# get '/comments/new' do
#   @suggestion = Suggestion.find(id: params[:id])
#   erb :'/comments/_comment'
# end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect '/suggestions'
  else
    erb :'/comments/_comment'
  end
end

