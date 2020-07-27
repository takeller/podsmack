require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Descriptions
 armchar_description = "Hi, I’m Dax Shepard, and I love talking to people. I am endlessly fascinated by the messiness of being human, and I find people who are vulnerable and honest about their struggles and shortcomings to be incredibly sexy. I invite you to join me as I explore other people’s stories. We will celebrate, above all, the challenges and setbacks that ultimately lead to growth and betterment. What qualifies me for such an endeavor? More than a decade of sobriety, a degree in Anthropology and four years of improv training. I will attempt to discover human “truths” without any laboratory work, clinical trials or data collection. I will be, in the great tradition of 16th-century scientists, an Armchair Expert."

conan_description = "After 25 years at the Late Night desk, Conan realized that the only people at his holiday party are the men and women who work for him.Over the years and despite thousands of interviews, Conan has never made a real and lasting friendship with any of his celebrity guests. So, he started a podcast to do just that.Deeper, unboundedly playful, and free from FCC regulations, Conan O’Brien Needs a Friend is a weekly opportunity for Conan to hang out with the people he enjoys most and perhaps find some real friendship along the way."

denver_pizza_description = "From deep dish downtown to pepperoni in Park Hill, Megan and Paul are hungry enough to review every pie in Mile High.   New episodes released intermittently."

life_kit_description = "Everyone needs a little help being a human. From sleep to saving money to parenting and more, we talk to the experts to get the best advice out there. Life Kit is here to help you get it together."

stuff_you_should_know_description = "If you've ever wanted to know about champagne, satanism, the Stonewall Uprising, chaos theory, LSD, El Nino, true crime and Rosa Parks, then look no further. Josh and Chuck have you covered."

#  users
users = Array.new(5, nil)
users = users.map do |user|
  User.create(user_name: Faker::Artist.name, uid: rand(100000).to_s)
end

# Podcasts (Locations/adult_content may be incorrect, but are for example purposes)

armchar_expert = Podcast.create(name: 'Armchar Expert', description: armchar_description, location: 'Denver', active: true, twitter: '@armchar_expert', photo: "https://picsum.photos/200/300", user_id: users[0].id, adult_content: true)

conan_needs_a_friend = Podcast.create(name: 'Conan Needs a Friend', description: conan_description, location: 'NYC', active: true, twitter: '@conan_needs_a_friend', photo: "https://picsum.photos/200/300", user_id: users[1].id, adult_content: true)

denver_pizza = Podcast.create(name: 'Denver Pizza', description: denver_pizza_description, location: 'Denver', active: true, twitter: '@denver_pizza', photo: "https://picsum.photos/200/300", user_id: users[2].id, adult_content: true)

life_kit = Podcast.create(name: 'Life Kit', description: life_kit_description, location: 'Dallas', active: true, twitter: '@life_kit', photo: "https://picsum.photos/200/300", user_id: users[3].id, adult_content: false)

stuff_you_should_know = Podcast.create(name: 'Stuff You Should Know', description: stuff_you_should_know_description, location: 'NYC', active: true, twitter: '@stuff_you_should_know', photo: "https://picsum.photos/200/300", user_id: users[4].id, adult_content: false)


# Admin user

User.create(user_name: "Taylor Keller", uid: ENV['TAYLOR_UID'], admin: true)
# Tags

software_tag = Tag.create(name: 'Software')
music_tag = Tag.create(name: 'Music')
travel_tag = Tag.create(name: 'Travel')
educational_tag = Tag.create(name: 'Educational')
interview_tag = Tag.create(name: 'Interview')
food_tag = Tag.create(name: 'Food')

# Podcast Tags

PodcastTag.create(podcast_id: armchar_expert.id, tag_id: interview_tag.id)
PodcastTag.create(podcast_id: armchar_expert.id, tag_id: educational_tag.id)

PodcastTag.create(podcast_id: conan_needs_a_friend.id, tag_id: interview_tag.id)

PodcastTag.create(podcast_id: denver_pizza.id, tag_id: food_tag.id)
PodcastTag.create(podcast_id: denver_pizza.id, tag_id: travel_tag.id)

PodcastTag.create(podcast_id: life_kit.id, tag_id: educational_tag.id)
PodcastTag.create(podcast_id: life_kit.id, tag_id: interview_tag.id)

PodcastTag.create(podcast_id: stuff_you_should_know.id, tag_id: educational_tag.id)
