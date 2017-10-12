User.delete_all
Suggestion.delete_all

10.times do
  User.create!(username: Faker::Name.first_name, password: Faker::Internet.free_email )
end

user = User.create(username: 'sam', password: 'asd')

10.times do
    user.suggestions.create!(title: Faker::Lorem.words(4, true).join(' '), description: Faker::Lorem.paragraphs.join(' '))
end
