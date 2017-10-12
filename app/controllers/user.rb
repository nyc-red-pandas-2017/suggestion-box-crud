get '/users/new' do
  @user = User.new
  # if @user.valid?
  #   redirect '/'
  # else
  #   status 422
  #   @errors = user.errors.full_messages
  erb :'users/new'
  # end
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
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end

