FactoryBot.define do
  factory :following do
    podcast { :podcast }
    user { :user }
  end
end
