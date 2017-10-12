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

  @new_suggestion = Suggestion.new(user_id: current_user.id, title: params[:suggestion][:title],
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
  if own_suggestion?(@suggestions)
    puts @suggestions.id
    erb :'/suggestions/edit'
  else
    redirect "suggestions"
  end
end

patch '/suggestions/:id' do
  puts "*******************"
  puts params

  @suggestions = Suggestion.find(params[:id])

    erb :'/suggestions/edit'

    puts "*******************"
    puts params[:suggestion][:title]
    puts "*******************"
    puts params[:suggestion][:description]
    puts "*******************"


    @suggestions.assign_attributes(user_id: current_user.id, title: params[:suggestion][:title],
                                 description: params[:suggestion][:description])

    if @suggestions.save
      redirect '/suggestions'
    else
      erb :'suggestions/edit'
    end
end

delete '/suggestions/:id' do
  @suggestions = Suggestion.find(params[:id])
  if own_suggestion?(@suggestions)
    @suggestions.destroy
    redirect '/suggestions'
  else
    redirect '/suggestions'
  end

end
