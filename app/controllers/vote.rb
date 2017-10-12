
def upvote
  @suggestion.find(params[:id])
  @suggestion.update_attributes(:votes, @suggestion[:votes] -1 )
end

def downvote
  @suggestion.find(params[:id])
  @suggestion.update_attributes(:votes, @suggestion[:votes] +1 )
end

post '/votes/:id/upvote' do
  upvote
end

post '/votes/:id/downvote' do
  downvote
end
