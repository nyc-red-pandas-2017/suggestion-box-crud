User.delete_all
Suggestion.delete_all

def user_args
  {first_name: Faker::GameOfThrones.character.split(" ")[0],
    last_name: Faker::GameOfThrones.character.split(" ")[1],
    username: Faker::GameOfThrones.dragon,
    email: Faker::Internet.email,
    password:"beaaaaaa"}
end

def suggestion_args
  {title: Faker::Hipster.sentence(3),
   description: Faker::ChuckNorris.fact,
   user_id: User.all.sample.id
   }
end


10.times do
  User.create(user_args)
end

15.times do
  Suggestion.create(suggestion_args)
end
