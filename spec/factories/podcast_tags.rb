FactoryBot.define do
  factory :podcast_tag do
    association :podcast, factory: :podcast
    association :tag, factory: :tag
  end
end
