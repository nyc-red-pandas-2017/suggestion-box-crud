get '/comments/new' do
  @suggestion = Suggestion.find(id: params[:id])
  erb :'/comments/_comment'
end

post '/comments/new' do

  @comment = Comment.new(suggestion_id: @suggestion.id)
  if @comment.save
    redirect '/suggestions'
  else
    erb :'/comments/_comment'
  end
end

