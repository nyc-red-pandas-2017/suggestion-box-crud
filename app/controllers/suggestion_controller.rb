# Route for release2
get "/" do
  erb :index
end

# Route for release1
# get "/" do
#   redirect "/suggestions"
# end


get "/suggestions" do
  @suggestions = Suggestion.all
  erb :"/suggestions/index"
end

get "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  puts @suggestion
  if @suggestion
    erb :"/suggestions/show"
  else
    "Suggestion not found"
  end
end

post "/suggestions" do
  @suggestion = Suggestion.new(title: params[:suggestion][:title],
    description: params[:suggestion][:description], user_id: session[:user_id])
  puts params
  if @suggestion.save
    redirect "/suggestions"
  else
    "Cannot add the suggestion"
  end
end

post "/suggestions/login" do
  @suggestion = Suggestion.new(title: params[:suggestion][:title],
    description: params[:suggestion][:description], user_id: session[:user_id])
  if @suggestion.save
    redirect '/users/login'
  else
    "Cannot add the suggestion"
  end
end

post "/suggestions/:id" do
  @suggestion = Suggestion.find_by(id: params[:id])
  if @suggestion
    @suggestion.destroy
    redirect '/users/login'
  else
    "Suggestion not found"
  end
end
