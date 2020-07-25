FactoryBot.define do
  factory :user do
    user_name { Faker::Artist.name }
    uid { rand(100000).to_s }
    access_token { Faker::Crypto.md5 }
    refresh_token { Faker::Crypto.md5 }
    admin { :default  }
  end

  factory :admin, parent: :user do
    admin { :true }
  end
end
