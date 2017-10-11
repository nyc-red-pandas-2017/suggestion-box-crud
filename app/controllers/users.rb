get '/users' do
  @users = User.all
  erb :'/users/index'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/users/#{@user.id}'
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @suggestions = @user.suggestions
  redirect '/' unless session[:id] == @user.id
  erb :'/users/show'
end
