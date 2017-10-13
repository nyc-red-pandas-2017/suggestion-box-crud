get '/suggestions' do
  @comments = Comment.all
  @suggestions = Suggestion.all #define instance variable for view
  erb :'suggestions/index' #show all suggestions view (index)
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :'suggestions/new' #show new suggestions view
end

post '/suggestions' do

  puts "============================================"
  #user = User.find_by(id: @user_id)
  #@suggestion = user.suggestions.new(params[:suggestion])
   # binding.pry
   @suggestion = Suggestion.new(params[:suggestion])
   @suggestion.user = current_user
   #binding.pry
  if @suggestion.save
    redirect '/suggestions'
  else
    @errors = @suggestion.errors.full_messages
    erb :'suggestions/new'
  end
end


get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id]) #define instance variable for view
  erb :'suggestions/show' #show single suggestion view
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find_by(id: params[:id])
  if @suggestion #define intstance variable for view
    erb :'suggestions/edit' #show edit suggestion view
  else
    erb :'suggestions/index'
  end
end

put '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id]) #define variable to edit

  if suggestion && suggestion.user.id == session[:user_id] #saves new suggestion or returns false if unsuccessful
    suggestion.update(params[:suggestion])
    redirect '/suggestions/#{suggestion.id}' #redirect back to suggestions index page
  else
    erb :'suggestions/edit' #show edit suggestion view again(potentially displaying errors)
  end
end

delete '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id]) #define suggestion to delete
  if @suggestion && suggestion.user.id == session[:user_id]
    suggestion.destroy #delete suggestion
    redirect '/suggestions' #redirect back to suggestions index page
  else
    "error"
  end
end


put "/suggestions/:id/thumbs_up" do
  suggestion = Suggestion.find(params[:id])
  suggestion.increment!(:thumbs_up)
  redirect "/suggestions/#{suggestion.id}"
end

put "/suggestions/:id/thumbs_down" do
  suggestion = Suggestion.find(params[:id])
  suggestion.decrement!(:thumbs_up)
  redirect "/suggestions/#{suggestion.id}"
end


