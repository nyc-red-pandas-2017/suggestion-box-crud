get "/users" do
  erb :'users/index'
end

get "/users/new" do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  redirect '/' unless @user.id == session[:user_id]
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :'users/new'
  end
end

