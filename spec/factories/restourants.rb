FactoryGirl.define do
  factory :restourant do
    name        Faker::Company.name
    address     Faker::Address.street_address
    description Faker::Lorem.sentence
    phone       Faker::PhoneNumber.phone_number
    # rate

    association :user_id, factory: :user
    association :category_id, factory: :category
  end
end
