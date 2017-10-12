get "/suggestions" do
  puts "*******************"
  puts "current_user.id:#{current_user.id}"
  puts "*******************"
  puts "session user id:#{session[:user_id]}"
  puts "*******************"
  @suggestions = Suggestion.all
  # puts @suggestions
  erb :'suggestions/index'
end

get '/suggestions/new' do
  erb :'suggestions/new'
end

post '/suggestions' do
  puts params[:suggestion][:title]

  @new_suggestion = Suggestion.create(title: params[:suggestion][:title],
                                      description: params[:suggestion][:description])
  if @new_suggestion.save

    redirect '/suggestions'
  else
    puts @errors
    erb :'/suggestions/new'
  end
end


get '/suggestions/:id' do
  puts "*******************"

  puts "current_user.id:#{current_user.id}"
  puts "*******************"
  puts "session user id:#{session[:user_id]}"
  puts "*******************"

  @suggestions = Suggestion.find(params[:id])
  erb :'/suggestions/show'
end

get '/suggestions/:id/edit' do
  puts params
  @suggestions = Suggestion.find(params[:id])
  puts @suggestions.id
  if @suggestions && current_user.id == session[:user_id]
    erb :'/suggestions/edit'
  else
    "Unauthorized to Edit!"
  end

end

patch '/suggestions/:id' do
  puts "*******************"
  puts params

  @suggestions = Suggestion.find(params[:id])
  if @suggestions && current_user.id == session[:user_id]
    erb :'/suggestions/edit'

    puts "*******************"
    puts params[:suggestion][:title]
    puts "*******************"
    puts params[:suggestion][:description]
    puts "*******************"


    @suggestions.assign_attributes(title: params[:suggestion][:title],
                                 description: params[:suggestion][:description])

    if @suggestions
      redirect '/suggestions'
    else
      erb :'suggestions/edit'
    end
  else
    "Unauthorized to Edit!"
  end
end

delete '/suggestions/:id' do
  @suggestions = Suggestion.find(params[:id])
  @suggestions.destroy!
  redirect '/'
end
