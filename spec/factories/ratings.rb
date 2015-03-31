FactoryGirl.define do 
  factory :rating do
    value Faker::Number.between(1,5)

    association :user_id, factory: :user
    association :restourant_id, factory: :restourant
  end
end
