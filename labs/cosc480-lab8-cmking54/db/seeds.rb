# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    s1 = Sight.create!(:title => "McGregory Hall Lounge", :description => "Everyone's favorite spot to study, sleep, relax, scribble on whiteboards, and take advantage of free food.")
    s1.photos.create(:caption => "Space to work and lounge.  Photo taken when the lounge was first constructed.", :image => File.new("app/assets/images/IMG_0888.jpg"))
    s1.photos.create(:caption => "Another photo taken when the lounge was first constructed.", :image => File.new("app/assets/images/IMG_0889.jpg"))
    s1.photos.create(:caption => "Spacious and whiteboardy!", :image => File.new("app/assets/images/IMG_7270.JPG"))
    s2 = Sight.create!(:title => "Taylor Lake", :description => "This is a lake?  Really?  Yes, by the strict definition of lake, this qualifies.  Sadly, Adam and Eve the swans have gone elsewhere and all we are left with are Canadian geese and the occasional mallard duck.")
    s2.photos.create(:caption => "The willow path, adjacent to Taylor Lake.", :image => File.new("app/assets/images/IMG_7278.JPG"))
    s2.photos.create(:caption => "The ice on Taylor Lake recedes in July, just.", :image => File.new("app/assets/images/IMG_7279.JPG"))
    s2.photos.create(:caption => "Resident aliens from Canada enjoying the lake.", :image => File.new("app/assets/images/IMG_7280.JPG"))
    s2.photos.create(:caption => "Resident aliens from Canada enjoying the lake.", :image => File.new("app/assets/images/IMG_7281.JPG"))
    s2.photos.create(:caption => "Looking across Taylor Lake.", :image => File.new("app/assets/images/IMG_7282.JPG"))
    s2.photos.create(:caption => "Payne Creek feeding into Taylor Lake, providing some evidence for the lakehood of said lake.", :image => File.new("app/assets/images/IMG_7283.JPG"))
    s3 = Sight.create!(:title => "Cooley Library", :description => "Colgate University's best kept secret.  Complete with a mosh pit of learning.")
    s3.photos.create(:caption => "Enter all who dare.", :image => File.new("app/assets/images/IMG_7271.JPG"))
    s3.photos.create(:caption => "A distinguishing feature of the Cooley library.  Music, unfortunately, not included.", :image => File.new("app/assets/images/IMG_7272.JPG"))
    s4 = Sight.create!(:title => "Hamilton Village Green", :description => "In winter, a good place to sculpt snow creatures.  In the summer, a good place to have a picnic.  Great place to bring takeaway from Maxwells, F&S, or HWF to enjoy on a nice day.")
    s4.photos.create(:caption => "Village green, dressed in white.", :image => File.new("app/assets/images/IMG_7274.JPG"))
    s4.photos.create(:caption => "A lovely fountain, which only spouts ice.  That happens all year round, it seems.", :image => File.new("app/assets/images/IMG_7275.JPG"))
    s4.photos.create(:caption => "For concerts on the village green in the summer, they just push the snow aside and play.", :image => File.new("app/assets/images/IMG_7276.JPG"))
    s4.photos.create(:caption => "Some great old trees on the green, looking fierce and bare.", :image => File.new("app/assets/images/IMG_7277.JPG"))

end
