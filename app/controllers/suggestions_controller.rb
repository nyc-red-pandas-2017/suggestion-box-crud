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
  Suggestion.create(title: params[:suggestion][:title],
                    description: params[:suggestion][:description])
  redirect '/suggestions'
end
