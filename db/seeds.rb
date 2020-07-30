require 'faker'
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #


#  users
users = Array.new(5, nil)
users = users.map do |user|
  User.create(user_name: Faker::Artist.name, uid: rand(100000).to_s)
end


real_estate_rookie_description = " <p>Ready to build your real estate empire… but not sure where to begin?</p><p>Think of us as your personal trainer.</p><p>From detailed breakdowns of real-world deals… to one-on-one coaching sessions and a warm, welcoming community… hosts Ashley Kehr and Felipe Mejia bring on a wide range of guests to tackle the “newbie” questions you've wondered about but might be afraid to ask.</p><p>Looking to 10X your real estate investing business this year? This show isn’t for you.</p><p>Looking for your first, second, or third deal -- or envisioning a more modest portfolio? Step right up.&nbsp;</p><p>Every Wednesday, we’ll arm you with the tips, tools, and roadmaps you'll need as you embark on your journey toward financial freedom.</p> "
so_you_want_description = " <p>*NEW EPISODES COMING IN JUNE* This is a show for anyone who’s ever considered, or even just daydreamed about, working in another country. Host Dylan Thuras, founder of Atlas Obscura, walks you through everything you’ll need to know to make the leap. Throughout, he’ll be joined by a range of guests with international experience, including Harvard Professor Tsedal Neeley; Duolingo’s Bozena Pajak; the head of Instagram Japan, Ian Spalter; acclaimed chef Rosio Sanchez and more. Presented by Cole Haan and T Brand Studio at The New York Times.</p> "
mad_money_description = "Mad Money takes viewers inside the mind of one of Wall Street’s most respected and successful money managers for free. Cramer is listeners’ personal guide through the confusing jungle of Wall Street investing, navigating through opportunities and pitfalls with one goal in mind—to help you make money. “Mad Money” features the unmatched, fiery opinions of Jim Cramer and the popular Lightning Round, in which he gives his buy, sell and hold opinions on stocks to callers."
rnz_description = "True stories of what it takes to raise children on your own in New Zealand."
economists_description = "The Economists uses the tools of economics to shine a light on life. "
biz_description = "The podcast for people who are addicted to business"
dear_hbr_description = "Work can be frustrating. How can you get along with that maddening coworker? Figure out what your unapproachable boss really wants? Motivate your demoralized team? Dear HBR: is here to help. With empathy, experience, and humor, veteran Harvard Business Review editors and co-hosts Alison Beard and Dan McGinn explore solutions to your workplace dilemmas. Bolstered by insights from guests and academic research, they help you navigate thorny situations to find a better way forward."


real_estate_rookie = Podcast.create(name: "Real Estate Rookie", description: real_estate_rookie_description , location: 'Denver', active: true, twitter: '@biggerpockets', facebook: '@biggerpockets', photo: "https://cdn-images-1.listennotes.com/podcasts/real-estate-rookie-E4j0gpsibCX-jznLViO3QI6.300x300.jpg", user_id: users[4].id, adult_content: false, podcast_uri: '24a970fdda68488abe659cfe15ae974c')

so_you_want = Podcast.create(name: "So You Want to Work Abroad", description: so_you_want_description , location: 'NYC', active: true, twitter: '@workAbroad', instagram: '@workAbroad', facebook: '@workAbroad', photo: "https://cdn-images-1.listennotes.com/podcasts/so-you-want-to-work-abroad-lMa-vPUDwrd-OnwYF5ZQzrP.300x300.jpg", user_id: users[4].id, adult_content: false, podcast_uri: '4bfec4f9214d42d08831d6ee67168a32' )

mad_money = Podcast.create(name: "Mad Money w/ Jim Cramer", description: mad_money_description , location: 'Dallas', active: false, twitter: '@madmoney', instagram: '@madmoney', facebook: '@madmoney', photo: "https://cdn-images-1.listennotes.com/podcasts/mad-money-w-jim-cramer-cnbc-qzcgTHGP63V-a8p6YXsZcxV.300x300.jpg", user_id: users[3].id, adult_content: true, podcast_uri: 'e3bb1e6c39d245f081a4a4db8ce9b661' )

rnz = Podcast.create(name: "RNZ: Flying Solo", description: rnz_description , location: 'San Fransisco', active: true, twitter: '@RNZ', instagram: '@RNZ', facebook: '@RNZ', photo: "https://cdn-images-1.listennotes.com/podcasts/rnz-flying-solo-radio-new-zealand-jCrRmkPl6Gn.300x300.jpg", user_id: users[1].id, adult_content: false, podcast_uri: '550e80e1c4a64bd290493b7bdbb4458c' )

economists = Podcast.create(name: "The Economists", description: economists_description , location: 'NYC', active: false, twitter: '@theEconomists', instagram: '@theEconomists', patreon: '@theEconomists', photo: "https://cdn-images-1.listennotes.com/podcasts/the-economists-abc-radio-WmTPLCdOARV-1QEvsFy3b7R.300x300.jpg", user_id: users[4].id, adult_content: false, podcast_uri: '94d63164b0434261aaff5f9573921c7b' )

biz = Podcast.create(name: "Business Addicts - The Podcast for people who are addicted to business", description: biz_description , location: 'Dallas', active: true, twitter: '@bizAddicts', instagram: '@bizAddicts', patreon: '@bizAddicts', facebook: '@bizAddicts', photo: "https://cdn-images-1.listennotes.com/podcasts/business-addicts-the-podcast-for-people-who-rNYAlydMn3K.300x300.jpg", user_id: users[2].id, adult_content: true, podcast_uri: 'e05b7fea53d549b0b23f38b5fc20c461' )

dear_hbr = Podcast.create(name: "Dear HBR:", description: dear_hbr_description , location: 'NYC', active: true, twitter: '@dearHBR', instagram: '@dearHBR', facebook: '@dearHBR', photo: "https://cdn-images-1.listennotes.com/podcasts/dear-hbr-harvard-business-review-EW7orSn-R31.300x300.jpg", user_id: users[1].id, adult_content: false, podcast_uri: '1d1a7ed40d624909b17d3f88bfcf362c' )

# # Admin user

User.create(user_name: "Taylor Keller", uid: ENV['TAYLOR_UID'], admin: true)
# # Tags


software_tag = Tag.create(name: 'Software')
music_tag = Tag.create(name: 'Music')
travel_tag = Tag.create(name: 'Travel')
educational_tag = Tag.create(name: 'Educational')
interview_tag = Tag.create(name: 'Interviews')
food_tag = Tag.create(name: 'Food')
lifestyle_tag = Tag.create(name: 'Lifestyle')
art_tag = Tag.create(name: 'Art')
business_tag = Tag.create(name: 'Business')


# # Podcast Tags

PodcastTag.create(podcast_id: real_estate_rookie.id, tag_id: interview_tag.id)
PodcastTag.create(podcast_id: real_estate_rookie.id, tag_id: educational_tag.id)
PodcastTag.create(podcast_id: real_estate_rookie.id, tag_id: business_tag.id)

PodcastTag.create(podcast_id: so_you_want.id, tag_id: interview_tag.id)
PodcastTag.create(podcast_id: so_you_want.id, tag_id: software_tag.id)
PodcastTag.create(podcast_id: so_you_want.id, tag_id: business_tag.id)
PodcastTag.create(podcast_id: so_you_want.id, tag_id: lifestyle_tag.id)

PodcastTag.create(podcast_id: mad_money.id, tag_id: business_tag.id)
PodcastTag.create(podcast_id: mad_money.id, tag_id: lifestyle_tag.id)

PodcastTag.create(podcast_id: rnz.id, tag_id: educational_tag.id)
PodcastTag.create(podcast_id: rnz.id, tag_id: interview_tag.id)
PodcastTag.create(podcast_id: rnz.id, tag_id: travel_tag.id)
PodcastTag.create(podcast_id: rnz.id, tag_id: food_tag.id)

PodcastTag.create(podcast_id: economists.id, tag_id: educational_tag.id)
PodcastTag.create(podcast_id: economists.id, tag_id: interview_tag.id)
PodcastTag.create(podcast_id: economists.id, tag_id: business_tag.id)

PodcastTag.create(podcast_id: biz.id, tag_id: educational_tag.id)
PodcastTag.create(podcast_id: biz.id, tag_id: interview_tag.id)
PodcastTag.create(podcast_id: biz.id, tag_id: business_tag.id)

PodcastTag.create(podcast_id: dear_hbr.id, tag_id: educational_tag.id)
PodcastTag.create(podcast_id: dear_hbr.id, tag_id: art_tag.id)
PodcastTag.create(podcast_id: dear_hbr.id, tag_id: music_tag.id)
PodcastTag.create(podcast_id: dear_hbr.id, tag_id: travel_tag.id)
PodcastTag.create(podcast_id: dear_hbr.id, tag_id: business_tag.id)
PodcastTag.create(podcast_id: dear_hbr.id, tag_id: lifestyle_tag.id)
