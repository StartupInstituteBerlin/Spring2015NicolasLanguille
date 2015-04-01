FactoryGirl.define do
  factory :reservation do
    last_name { generate :name }
    datetime Date.tomorrow
    no_people { generate :number }
    email { generate :email }

    association :restourant_id, factory: :restourant
  end
end
