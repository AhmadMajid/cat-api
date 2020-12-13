# spec/factories/cats.rb
FactoryBot.define do
  factory :cat do
    name { Faker::Movies::StarWars.character }
    done false
    todo_id nil
  end
end
