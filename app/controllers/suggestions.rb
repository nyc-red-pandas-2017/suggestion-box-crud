get "/suggestions" do
  redirect "/"
end

get "/suggestions/new" do
  erb :"suggestions/new"
end

post "/suggestions" do
  @new_suggestion = Suggestion.new(params[:suggestion])
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
  "Put Edit Hello"
end

delete "/suggestions/:id" do
  "Delete Hello"
end
