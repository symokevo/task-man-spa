# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Clear existing data
Post.destroy_all

puts "Creating 100 sample posts..."

# Array of possible categories/themes to make titles more varied
categories = ["Technology", "Business", "Science", "Health", "Travel", "Food", "Education", "Sports", "Art", "Politics"]

100.times do |i|
  category = categories.sample
  Post.create!(
    title: [
      Faker::Lorem.sentence(word_count: 3),
      "The future of #{category}",
      "How #{category.downcase} is changing the world",
      "5 things you didn't know about #{category.downcase}",
      "#{category} trends in #{rand(2023..2025)}",
      "Why #{category.downcase} matters more than ever",
      Faker::Book.title,
      Faker::Movie.quote
    ].sample,
    body: [
      Faker::Lorem.paragraphs(number: rand(2..5)).join("\n\n"),
      ([Faker::Lorem.paragraph, Faker::Markdown.ordered_list, Faker::Lorem.paragraph]).join("\n\n"),
      ([Faker::Lorem.paragraph, Faker::Markdown.emphasis, Faker::Lorem.paragraph]).join("\n\n"),
      ([Faker::Books::Dune.quote, Faker::Lorem.paragraph, Faker::Books::Lovecraft.sentence]).join("\n\n")
    ].sample,
    created_at: Faker::Time.between(from: 1.year.ago, to: Time.now)
  )

  # Print progress
  print '.' if (i % 10).zero?
end

puts "\nCreated #{Post.count} posts!"
