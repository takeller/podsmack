FactoryBot.define do
  factory :tag do
    name { Faker::Games::Pokemon.name }
  end
end
