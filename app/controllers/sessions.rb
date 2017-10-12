get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  puts params
  @user = User.authenticate(params[:username],params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Invalid login"
    erb :'/sessions/new'
  end
end

#session logout should be a POST or DELETE request NOT GET
get '/sessions/logout' do
  session.clear
  redirect "/"
end
