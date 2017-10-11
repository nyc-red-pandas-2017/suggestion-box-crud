get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find_by(params[:user])
  redirect '/' unless @user.id == session[:user_id]
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end
