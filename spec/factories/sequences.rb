FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :name do |n|
    "whateever you want #{n}"
  end

  sequence :restourant_name do |n|
    "Restourant #{n}"
  end

  sequence :address do |n|
    "whereeverstreet #{n}"
  end

  sequence :phone do |n|
    "#{n}#{n+1}#{n+3}#{n+5}"
  end

  sequence :number do |n|
    "#{n}"
  end
end
