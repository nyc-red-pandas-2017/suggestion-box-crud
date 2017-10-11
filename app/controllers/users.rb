get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  puts params
  @user = User.new(params[:user])
  @user.password = params[:password_hash]
  if @user.save
    print "SAVED"
  else
    print "****************not saved*****************"
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end

end
