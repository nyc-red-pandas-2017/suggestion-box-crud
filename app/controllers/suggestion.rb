get '/suggestions' do
  @suggestions = Suggestion.all
  erb :"suggestions/index"
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :"suggestions/index"
end

post '/suggestions' do
  @suggestion = Suggestion.new(user_id: current_user.id, title: params[:suggestion][:title], details: params[:suggestion][:details])
  if @suggestion.save
    redirect "/users/#{current_user.id}"
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/show"
end

delete '/suggestions/:id' do
    @suggestion = Suggestion.find_by(id: params[:id])
    if @suggestion.user_id == current_user.id
      @suggestion.destroy!
      redirect "/users/#{current_user.id}"
  end
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/edit"
end

put '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  @suggestion.update
  redirect "/users/#{current_user.id}"
end
