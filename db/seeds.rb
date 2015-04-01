# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

owner = User.create(
          email: "owner@rest.com",
          password: "12345678",
          password_confirmation: "12345678",
          role_name: "owner"
          )


registered_user = User.create(
                    email: "registered@rest.com",
                    password: "12345678",
                    password_confirmation: "12345678",
                    role_name: "registered"
                    )

category_names = [
    'italian',
    'french',
    'german',
    'arabic',
    'chinese'
    ]

category_names.each do |category_name|

  category = Category.create(
              name: category_name
              )
end

Category.all.each do |category|
  2.times.each do
    address = Faker::Address.street_name + ", " +
              Faker::Address.zip + ", " +
              Faker::Address.city

    restourant = Restourant.create(
                  name: Faker::Company.name,
                  description: Faker::Lorem.sentence,
                  phone: Faker::PhoneNumber.phone_number,
                  address: address,
                  user_id: owner.id,
                  category_id: category.id
                  )

    3.times.each do
      Reservation.create(
        last_name: Faker::Name.last_name,
        datetime: Faker::Time.forward(23,:evening),
        no_people: Faker::Number.number(1),
        email: Faker::Internet.email,
        restourant_id: restourant.id
        )
    end
  end
end

Restourant.all.each do |restourant|
  User.where(role_name: "registered").all.each do |user|
    Rating.create(
      value: Faker::Number::between(1,5),
      user_id: user.id,
      restourant_id: restourant.id
      )
  end
end
