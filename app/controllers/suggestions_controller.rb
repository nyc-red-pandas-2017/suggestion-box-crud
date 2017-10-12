get "/suggestions" do
  puts "*******************"
  puts current_user.user_id
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
     erb :'/suggestions'
    # redirect '/suggestions'
  else
    puts @errors
    erb :'/suggestions/new'
  end
end


get '/suggestions/:id' do
  puts "*******************"

  puts "current_user.id:#{current_user.id}"
  puts "*******************"

  @suggestions = Suggestion.find(params[:id])
  erb :'/suggestions/show'
  # erb :'/suggestions/index'
end

get '/suggestions/:id/edit' do
  puts params
  @suggestions = Suggestion.find(params[:id])
  erb :'/suggestions/edit'
end

patch '/suggestions/:id' do
  puts "*******************"
  puts params

  @suggestions = Suggestion.find(params[:id])

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
end

delete '/suggestions/:id' do
  @suggestions = Suggestion.find(params[:id])
  @suggestions.destroy!
  redirect '/'
end
