
def upvote
  @suggestion = Suggestion.find(params[:id])
  @suggestion.update(votes: @suggestion.votes + 1)
  @suggestion.save
end

def downvote

  @suggestion = Suggestion.find(params[:id])
  @suggestion.update(votes: @suggestion.votes - 1)
  @suggestion.save
end

post '/suggestions/:id/upvote' do
  upvote
  redirect "/users/#{current_user.id}"
end

post '/suggestions/:id/downvote' do

  downvote
  redirect "/users/#{current_user.id}"
end
