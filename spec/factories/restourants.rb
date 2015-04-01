FactoryGirl.define do
  factory :restourant do
    name        { generate :restourant_name }
    address     { generate :address }
    description "Lorem ipsum dolor sit amet,
                consectetur adipisci elit,
                sed eiusmod tempor incidunt
                ut labore et dolore magna aliqua"
    phone       { generate :phone }
    # rate

    association :user_id, factory: :user
    association :category_id, factory: :category
  end
end
