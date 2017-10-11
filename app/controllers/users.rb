get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  "Hello world"
end
