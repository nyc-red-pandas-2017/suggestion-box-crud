User.delete_all
Suggestion.delete_all

10.times do
  User.create!(username: Faker::Name.first_name, password: Faker::Internet.free_email )
end

10.times do
  Suggestion.create!(title: Faker::Lorem.words(4, true), description: Faker::Lorem.paragraphs )
end
