FactoryGirl.define do
  factory :restourant do
    name        { generate :restourant_name }
    address     { generate :address }
    description "Est repellat soluta ut sint."
    phone       { generate :phone }
    # rate

    association :user_id, factory: :user
    association :category_id, factory: :category
  end
end
