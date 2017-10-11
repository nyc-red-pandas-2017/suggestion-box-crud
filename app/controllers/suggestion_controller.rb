get "/" do
  redirect "/suggestions"
end


get "/suggestions" do
  @suggestions = Suggestion.all
  erb :"/suggestions/index"
end

post "/suggestions" do
  @suggestion = Suggestion.new(title: params[:suggestion][:title],
    description: params[:suggestion][:description])
  if @suggestion.save
    redirect "/suggestions"
  else
    "Cannot add the suggestion"
  end
end

