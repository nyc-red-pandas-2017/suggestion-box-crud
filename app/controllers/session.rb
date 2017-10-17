get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  # @suggestion = Suggestion.find_by(params[:id])
  if @user && User.authenticate(params[:username], params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Invalid login, try again"
    erb :'sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
