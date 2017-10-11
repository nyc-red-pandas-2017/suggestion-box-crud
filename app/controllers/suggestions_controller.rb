get '/' do
  redirect '/suggestions'
end

get "/suggestions" do
  @suggestions = Suggestion.all
  puts @suggestions
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
  puts params
  @suggestions = Suggestion.find(params[:id])
  erb :'/suggestions/show'
end
