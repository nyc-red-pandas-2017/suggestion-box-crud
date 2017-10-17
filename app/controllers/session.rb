get '/session/new' do
  erb :'/session/login'
end


post '/session' do
  user = User.authenticate(params[:username],params[:password] )
  if user
    session[:user_id] = user.id
    redirect '/suggestions'
  else
    @error = "Error"
    erb :'/session/new'
  end
end

# get '/session/delete' do
#   session.delete
#   redirect '/'
# end
