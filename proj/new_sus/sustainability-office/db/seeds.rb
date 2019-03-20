# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

#------------------------------------ new code--------------------------------------
Meeting.delete_all

eventA = Meeting.create!(
  title:"Living Writers Series",
  location: "Colgate Memorial Chapel",
  points: 1,
  description: "The Fall 2017 Living Writers lineup includes three Pulitzer Prize winners of fiction, nonfiction, and poetry. Your level of participation is up to you.",
  date: Time.now
)

eventB = Meeting.create!(
  title:"ENST Brown Bag",
  location: "Alana Cultural Center, Multipurpose Room",
  points: 1,
  description: "Community Challenges & Sustainable Solutions - Seminar in Environmental Studies: Students from the ENST 490 seminar will present their work at this final ENST brown bag of the semester.",
  date: Time.now
)


eventC = Meeting.create!(
  title:"What if We Put Poverty First?",
  location: "Love Auditorium, Olin Hall",
  points: 1,
  description: "For the past three years that I’ve been writing at Grist, it’s been my job to try and figure out the answers to one big problem: How do we, as a species, feed ourselves without causing global collapse? Food moves to money and away from poverty, so I soon discovered the question I was really asking was: How do we tackle poverty without wrecking the planet? The answers still have a lot to do with agriculture, because 70 percent of the 700 million people living in extreme poverty across the globe are farmers, and no country has reduced poverty on a large scale without a corresponding investment in agriculture.",
  date: Time.now
)

eventD = Meeting.create!(
  title:"Exhibit: Unsettled Conditions: How We Talk about the Environment and Our Place In It",
  location: "Longyear Museum of Anthropology",
  points: 2,
  description: "Unsettled Conditions: How We Talk about the Environment and Our Place in It is now on view at the Longyear Museum of Anthropology. From the Tuareg in the Sahara to the Inuit in the Arctic, and from island communities in the Pacific to communities in central New York, this student co-curated exhibition explores human interactions with diverse environments.  How do environments shape us, and how do we shape environments? How do we talk about the environment and our experiences within it, and why does that matter? How do we imagine our future environments, and what are we doing now to help shape those possibilities?",
  date: Time.now
)


Person.delete_all

Person.create!(first_name: "First", last_name: "User", points: 8, role: "Professor",
  bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque condimentum nibh ac metus cursus consequat"
)
Person.create!(first_name: "Test", last_name: "User", points: 8, role: "Student",
  bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis maximus suscipit. Aliquam erat volutpat. Cras eu velit eget nulla cursus bibendum sed at eros."
)
Person.create!(first_name: "Last", last_name: "User", points: 8, role: "Staff",
  bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus arcu nibh, dapibus sit amet vulputate eget, luctus in."
)
