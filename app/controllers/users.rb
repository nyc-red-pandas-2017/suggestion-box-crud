get "/users" do
  redirect "/"
end

get "/users/new" do
  erb :'users/new'
end

get "/users/:user_id" do
  @user = User.find(params[:user_id])
  @suggestions = Suggestion.where(user_id: @user.id)
  redirect "/" unless authorized?(@user)
  @up_votes = @user.up_votes
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
