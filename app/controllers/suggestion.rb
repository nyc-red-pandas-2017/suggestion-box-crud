get '/suggestions' do
  @suggestions = Suggestion.all #define instance variable for view
  erb :'suggestions/index' #show all suggestions view (index)
end

get '/suggestions/new' do
  erb :'suggestions/new' #show new suggestions view
end

post '/suggestions' do
  # get userid from session
  user_id = 1
  user = User.find_by(id: user_id)
  @suggestion = user.suggestions.new(params[:suggestion])
  # @suggestion = Suggestion.new(params[:suggestion])
  if @suggestion.save
    redirect '/suggestions'
  else
    erb :'suggestions/new'
  end
end


get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id]) #define instance variable for view
  erb :'suggestions/show' #show single suggestion view
end

put '/suggestions/:id/thumbs_up' do
  suggestion = Suggestion.find(params[:id])
  sugestion.increment!(:thumbs_up)
  redirect '/suggestions/#{suggestion.id}'
end


get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find(params[:id]) #define intstance variable for view
  erb :'suggestions/edit' #show edit suggestion view
end

put '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id]) #define variable to edit
  @suggestion.assign_attributes(params[:suggestion]) #assign new attributes
  if @suggestion.save #saves new suggestion or returns false if unsuccessful
    redirect '/suggestions' #redirect back to suggestions index page
  else
    erb :'suggestions/edit' #show edit suggestion view again(potentially displaying errors)
  end
end

delete '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id]) #define suggestion to delete
  @suggestion.destroy #delete suggestion
  redirect '/suggestions' #redirect back to suggestions index page
end


