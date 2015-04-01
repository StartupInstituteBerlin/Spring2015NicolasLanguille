FactoryGirl.define do
  factory :rating do
    value rand(5..30)

    association :user_id, factory: :user
    association :restourant_id, factory: :restourant
  end
end
