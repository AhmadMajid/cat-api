# spec/factories/cats.rb
FactoryBot.define do
  factory :cat do
    name { Faker::StarWars.character }
    done false
    todo_id nil
  end
end
