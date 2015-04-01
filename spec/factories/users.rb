FactoryGirl.define do
  factory :user do
    email                 { generate :email }
    password              "password"
    password_confirmation "password"
  end
end
