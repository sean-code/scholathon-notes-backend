# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


10.times do
    puts "Seeding Users.."
    user1 = User.create(username: Faker::Twitter.screen_name, bio: Faker::Lorem.paragraph(sentence_count: 3), password: Faker::Config.random.seed )
    user2 = User.create(username: Faker::Twitter.screen_name, bio: Faker::Lorem.paragraph(sentence_count: 3), password: Faker::Config.random.seed )
    puts "Seeded Users!!"
end
10.times do
    puts "Seeding Notes..."
    note1 = Note.create(title: Faker::Book.title, content: Faker::Books::Lovecraft.sentence(word_count: 3), user: user1)
    note2 = Note.create(title: Faker::Book.title, content: Faker::Books::Lovecraft.sentence(word_count: 2) user: user2)
    puts "Seeded Notes!!"
end