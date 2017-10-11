get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :"index"
end

post '/suggestions' do
  @suggestion = Suggestion.new(params[:suggestion])
  if @suggestion.save
    redirect "/"
  else
    #errors
  end
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find_by(id: params[:id])
  erb :"suggestions/show"
end
