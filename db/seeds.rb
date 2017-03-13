# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  @user = User.create!(
    name: Faker::Name.first_name,
    bio: Faker::TwinPeaks.quote,
    avatar: Faker::Avatar.image
  )
  15.times do
  Post.create!(
    body: Faker::Hipster.paragraphs(2).join("\n\n"),
    title: Faker::TwinPeaks.quote,
    user_id: @user.id,
    created_at: rand(1..700).days.ago
  )
  end
end
