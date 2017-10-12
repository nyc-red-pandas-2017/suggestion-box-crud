get '/suggestions' do
  @suggestions = Suggestion.all
  erb :'suggestions/index'
end

get '/suggestions/new' do
  @suggestion = Suggestion.new
  erb :'suggestions/new'
end

post '/suggestions' do
  @suggestion = current_user.suggestions.create(params[:suggestion])
  redirect '/suggestions'
end

get '/suggestions/:id' do
  @suggestion = Suggestion.find(params[:id])
  erb :'suggestions/show'
end

get '/suggestions/:id/edit' do
  @suggestion = Suggestion.find(params[:id])
  if current_user == @suggestion.user
	erb :'suggestions/edit'
  else
  	redirect "/suggestions/#{@suggestion.id}"
  end
end

patch '/suggestions/:id' do
	puts params
	@suggestion = Suggestion.find_by(id: params[:id])
	@suggestion.update(params[:suggestion])
	redirect "/suggestions"
end

delete '/suggestions/:id' do 
	@suggestion = Suggestion.find_by(id: params[:id])
	if current_user == @suggestion.user
		Suggestion.find(params[:id]).destroy!
		redirect '/suggestions'
	else
		redirect '/suggestions/:id'
	end
end

