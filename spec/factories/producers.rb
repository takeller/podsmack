FactoryBot.define do
  factory :producer do
    name { Faker::Movies::Ghostbusters.actor}
    access_token { Faker::Crypto.md5 }
    refresh_token { Faker::Crypto.md5 }
    role { :default  }
    password_digest { Faker::Color.color_name }
  end
end
