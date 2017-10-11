get "/suggestions" do
  redirect "/"
end

get "/suggestions/new" do
  current_user
  redirect '/' unless authorized?(current_user)
  erb :"suggestions/new"
end

post "/suggestions" do
  current_user
  redirect '/' unless authorized?(current_user)
  @new_suggestion = Suggestion.new(user_id: current_user.id, title: params[:suggestion][:title], body: params[:suggestion][:body])
  if @new_suggestion.save
    redirect "/"
  else
    @errors = @new_suggestion.errors.full_messages
    erb :"suggestions/new"
  end
end

# Why does this route have to be below "/suggestions/new" to work
get "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/show"
end

get "/suggestions/:id/edit" do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/edit"
end

put "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  redirect "/" unless own_suggetion?(@suggestion)
  @suggestion.assign_attributes(params[:suggestion])
  if @suggestion.save
    redirect "/"
  else
    @errors = @suggestion.errors.full_messages
    erb :'suggestions/edit'
  end
end

delete "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  redirect "/" unless own_suggetion?(@suggestion)
  @suggestion = Suggestion.find_by(id: params[:id])
  @suggestion.destroy!
  redirect "/"
end
