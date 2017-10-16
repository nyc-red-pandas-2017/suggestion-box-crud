get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  puts params
  @user = User.new(params[:user])
  # @user.password = params[:password_hash]
  if @user.save
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  if current_user.id == params[:id].to_i
    user_suggestions
    @user = User.find(params[:id])
    erb :'/sessions/show'
  else
    redirect "/sessions/new"
  end
end
