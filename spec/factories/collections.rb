# spec/factories/collections.rb
FactoryBot.define do
  factory :collection do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end
