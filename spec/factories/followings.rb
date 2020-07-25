FactoryBot.define do
  factory :following do
    association :podcast, factory: :podcast
    association :user, factory: :user 
  end
end

