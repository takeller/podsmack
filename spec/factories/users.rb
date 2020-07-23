FactoryBot.define do
  factory :user do
    user_name { Faker::Artist.name }
    access_token { Faker::Crypto.md5 }
    refresh_token { Faker::Crypto.md5 }
    role { :default  }
    password_digest { Faker::Creature::Dog.name }
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
