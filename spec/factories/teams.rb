FactoryBot.define do
   factory :team do
    name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:20) }
  end
end