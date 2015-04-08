FactoryGirl.define do
  factory :rating do
    value { generate :number }

    association :user_id, factory: :user
    association :restourant_id, factory: :restourant
  end
end
