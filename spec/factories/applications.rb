FactoryBot.define do
  factory :application do
    podcast_name { "MyString" }
    location { "MyString" }
    twitter { "MyString" }
    patreon { "MyString" }
    instagram { "MyString" }
    facebook { "MyString" }
    description { "MyString" }
    adult_content { false }
    spotify_uri { "MyString" }
    photo { "MyString" }
    user { nil }
  end
end
