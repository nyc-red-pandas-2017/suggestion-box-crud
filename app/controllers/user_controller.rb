post '/users/signup' do
  @user = User.new(:name => params[:user][:name], :password => params[:user][:password])
  if @user.save
    erb :'/users/new'
  else
    "Cannot sign up, username already exists"
  end
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/login' do
  redirect '/'
end

post '/users/login' do
  @user = User.find_by(:name => params[:user][:name])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    erb :'users/login'
  else
    "Cannot log in, user not registered"
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect "/"
end
