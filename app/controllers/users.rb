get "/users" do
  redirect "/"
end

get "/users/:id" do
# Creating a more limited variable for just the user's suggestions might be more secure
  @suggestions = Suggestion.all
  @user = User.find_by(id: params[:id])
  redirect "/" unless authorized?(@user)
  erb :"users/show"
end
