get 'suggestions' do
  @suggestions = Suggestion.all
  erb :"suggestions/index"
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :"suggestions/index"
end

post '/suggestions' do
  @suggestion = Suggestion.new(params[:suggestion])
  if @suggestion.save
    redirect "/suggestions"
  else
    #error
    erb :"suggestions/index"
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/show"
end
