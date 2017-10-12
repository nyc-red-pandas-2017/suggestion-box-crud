get '/users' do
  @user = User.all
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  redirect '/' unless @user.id = session[:user_id]
  erb :'session/login'
end

post '/users' do
  new_user = User.new(params[:user])
  if new_user.save
    session[:user_id] = new_user.id
    redirect '/users/:id'
  else
    get_errors(new_user)
    redirect '/users/new'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

