FactoryBot.define do
  factory :user do
    user_name { "MyString" }
    access_token { "MyString" }
    refresh_token { "MyString" }
    role { 1 }
    password_digest { "MyString" }
  end
end
