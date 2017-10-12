get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  puts params
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    "login success"
    redirect "/suggestions/#{@user.id}"
  else
    @error = "Invalid login, try again"
    erb :'sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end



