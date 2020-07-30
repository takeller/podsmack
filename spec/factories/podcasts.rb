FactoryBot.define do
  factory :podcast do
    name { Faker::Name.unique.name  }
    location { Faker::Address.city }
    twitter { Faker::Hacker.noun  }
    patreon { Faker::Hacker.noun  }
    instagram { Faker::Hacker.noun  }
    facebook { Faker::Hacker.noun  }
    description {Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote }
    adult_content { false }
    podcast_uri { "24a970fdda68488abe659cfe15ae974c" }
    photo { Faker::Placeholdit.image }
    active { false }
    user
  end
end
