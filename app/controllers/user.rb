get '/users' do
  @user = User.all
  erb :index
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  redirect '/' unless @user.id = session[:user_id]
  erb :'session/login'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/users'
  else
    @errors = @user.errors.values.flatten
    erb :'/users/new'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

