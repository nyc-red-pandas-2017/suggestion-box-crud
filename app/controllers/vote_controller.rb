get '/votes' do
  erb :'/users/login'
end


post '/votes' do
 @votes_count = 15
 if request.xhr?
  erb :'/votes/_new', layout: false
 else
  erb :'/users/login'
 end
end
