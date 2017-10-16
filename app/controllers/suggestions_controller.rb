get "/suggestions" do
  @suggestions = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  if request.xhr?
    erb :'/suggestions/_new', layout: false
  else
    erb :'suggestions/new'
  end
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
  @suggestions = Suggestion.find(params[:id])
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

post '/suggestions/:id/vote' do
  "Hello World"
end
