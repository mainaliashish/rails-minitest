# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "bcrypt"


require 'faker'
require 'bcrypt'

User.create(
  first_name: "Ashish", last_name: "Mainali", 
  slug: Faker::Internet.slug(words: 'ashish mainali', glue: '-'),
  email: "ashish@admin.com", username: "ashish", role: 1,
  password_digest: BCrypt::Password.create("password")
)
puts "Admin user created."

10.times do
  User.create([{
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    username: Faker::Internet.username,
    password_digest: BCrypt::Password.create("password"),
    slug: Faker::Internet.slug(glue: '-'),
    role: 0
  }])
end

puts "Users created."

users_id = User.pluck(:id)
# user_id = users_id.sample(1).join.to_i
i = 0
50.times do
  Article.create([{
    title: Faker::Quote.famous_last_words,
    slug: Faker::Internet.slug(words: "user article #{i}", glue: '-'),
    body: Faker::Lorem.sentence(word_count: 50),
    user_id: users_id.sample(1).join.to_i
  }])
  puts "Article #{i += 1} created."
end 



