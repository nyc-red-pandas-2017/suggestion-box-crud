get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/login"
  else
    erb :"users/new"
  end
end

get '/login' do
  erb :"/users/login"
end

post '/login' do
  "Hello world"
end
