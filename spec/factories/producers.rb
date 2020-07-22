FactoryBot.define do
  factory :producer do
    name { "MyString" }
    access_token { "MyString" }
    refresh_token { "MyString" }
    role { 1 }
    password_digest { "MyString" }
  end
end
