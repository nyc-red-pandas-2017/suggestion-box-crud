get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:user][:username], params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect '/suggestions'
  else
    status 422
    @errors = ["Yeah, that's gonna be a no for me, dawg"]
    erb :'sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end

#IuliaSwagTutorial
# post '/sessions' do
#   user = User.find_by(username: params[:user][:username])
#   if user && user.authenticate(params[:user][:password])
#     session[:user_id] = user.id
#   else
#   end
# end
