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

get "/user/new" do
  erb :'users/new'
end

post '/users' do
    @user = User.new(params[new_user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end
