# frozen_string_literal: true

   factory :team do
    name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:20) }
    user
  end
end
