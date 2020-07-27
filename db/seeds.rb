# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# Podcasts (Locations may be incorrect, but are for example purposes)

armchar_expert = create(:podcast, name: 'Armchar Expert', description: armchar_description, location: 'Denver', active: true)

conan_needs_a_friend = create(:podcast, name: 'Conan Needs a Friend', description: conan_description, location: 'NYC', active: true)

denver_pizza = create(:podcast, name: 'Denver Pizza', description: denver_pizza_description, location: 'Denver', active: true)

life_kit = create(:podcast, name: 'Life Kit', description: life_kit_description, location: 'Dallas', active: true)

stuff_you_should_know = create(:podcast, name: 'Stuff You Should Know', description: stuff_you_should_know_description, location: 'NYC', active: true)


# Admin user

create(:user, user_name: "Taylor Keller", uid: ENV['TAYLOR_UID'], admin: true)
# Tags

software_tag = create(:tag, name: 'Software')
music_tag = create(:tag, name: 'Music')
travel_tag = create(:tag, name: 'Travel')
educational_tag = create(:tag, name: 'Educational')
interview_tag = create(:tag, name: 'Interview')
food_tag = create(:tag, name: 'Food')

# Podcast Tags

create(:podcast_tag, podcast: armchar_expert.id, tag: interview_tag.id)
create(:podcast_tag, podcast: armchar_expert.id, tag: educational_tag.id)

create(:podcast_tag, podcast: conan_needs_a_friend.id, tag: interview_tag.id)

create(:podcast_tag, podcast: denver_pizza.id, tag: food_tag.id)
create(:podcast_tag, podcast: denver_pizza.id, tag: travel_tag.id)

create(:podcast_tag, podcast: life_kit.id, tag: educational_tag.id)
create(:podcast_tag, podcast: life_kit.id, tag: interview_tag.id)

create(:podcast_tag, podcast: stuff_you_should_know.id, tag: educational_tag.id)



# Descriptions
 armchar_description = "Hi, I’m Dax Shepard, and I love talking to people. I am endlessly fascinated by the messiness of being human, and I find people who are vulnerable and honest about their struggles and shortcomings to be incredibly sexy. I invite you to join me as I explore other people’s stories. We will celebrate, above all, the challenges and setbacks that ultimately lead to growth and betterment. What qualifies me for such an endeavor? More than a decade of sobriety, a degree in Anthropology and four years of improv training. I will attempt to discover human “truths” without any laboratory work, clinical trials or data collection. I will be, in the great tradition of 16th-century scientists, an Armchair Expert."

conan_description = "After 25 years at the Late Night desk, Conan realized that the only people at his holiday party are the men and women who work for him.Over the years and despite thousands of interviews, Conan has never made a real and lasting friendship with any of his celebrity guests. So, he started a podcast to do just that.Deeper, unboundedly playful, and free from FCC regulations, Conan O’Brien Needs a Friend is a weekly opportunity for Conan to hang out with the people he enjoys most and perhaps find some real friendship along the way."

denver_pizza_description = "From deep dish downtown to pepperoni in Park Hill, Megan and Paul are hungry enough to review every pie in Mile High.   New episodes released intermittently."

life_kit_description = "Everyone needs a little help being a human. From sleep to saving money to parenting and more, we talk to the experts to get the best advice out there. Life Kit is here to help you get it together."

stuff_you_should_know_description = "If you've ever wanted to know about champagne, satanism, the Stonewall Uprising, chaos theory, LSD, El Nino, true crime and Rosa Parks, then look no further. Josh and Chuck have you covered."
