get "/users" do
  redirect "/"
end

get "/users/new" do
  erb :'users/new'
end

get "/users/:user_id" do
# Creating a more limited variable for just the user's suggestions might be more secure
  @suggestions = Suggestion.all
  @user = User.find(params[:user_id])
  redirect "/" unless authorized?(@user)
  @all_users = User.all
  @up_votes = @user.up_votes
  # @user_id_p = @user.username
  erb :"users/show"
end

post '/users' do
    @user = User.new(params[:new_user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end
