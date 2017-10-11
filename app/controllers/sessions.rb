get '/sessions/login' do
  erb :'/sessions/login'
end

post '/sessions/login' do
  @user = User.authenticate(params[:user][:username], params[:user][:password])
  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Error, invalid login"
    redirect 'sessions/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
