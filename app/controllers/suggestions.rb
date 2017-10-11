get '/' do
  @suggestions = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :'suggestions/new'
end

post '/suggestions' do
  @suggestion = Suggestion.new(params)
  if @suggestion.save
    redirect '/'
  else
    @errors = @suggestion.errors.full_messages
    erb :'suggestion/new'
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :'suggestions/show'
end

get '/suggestions/:id/edit' do
  "edit form"
end
