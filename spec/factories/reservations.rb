FactoryGirl.define do
  factory :reservation do
    last_name Faker::Name.last_name
    datetime Faker::Time.forward(23,:evening)
    no_people Faker::Number.number(1)
    email Faker::Internet.email

    association :restourant_id, factory: :restourant     
  end
end
