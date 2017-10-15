post '/users/signup' do
  @user = User.new(name: params[:user][:name], password: params[:user][:password])
  if @user.save
    puts @user.name
    puts @user.password
    erb :'/users/new'
  else
    if @user.name.nil? || @user.name.empty?
      "username is missing"
    elsif @user.password.nil? || @user.password.empty?
      "password is missing"
    else
      "Cannot sign up, username already exists"
    end
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/login' do
  @user = User.find_by(id: session[:user_id])
  if @user
     # User publications
    @user_own_suggestions = Suggestion.where(user_id: session[:user_id])
    # Other users' publications
    @user_other_suggestions = Suggestion.where.not(user_id: session[:user_id])
    erb :'/users/login'
  else
    "Am I in the session?"
  end
end

post '/users/login' do
  @user = User.find_by(name: params[:user][:name])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    # User publications
    @user_own_suggestions = Suggestion.where(user_id: session[:user_id])
    # Other users' publications
    @user_other_suggestions = Suggestion.where.not(user_id: session[:user_id])
    erb :'/users/login'
  else
    if @user.name.nil? || @user.name.empty?
      "username is missing"
    elsif @user.password.nil? || @user.password.empty?
      "password is missing"
    else
      "user now registered"
    end
  end
end

get '/users/logout' do
  session.clear # deletes everything in the hash, but not the hash itself
  #session[:user_id] = nil
  redirect "/"
end
