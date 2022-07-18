require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(name: "Chevron",
                image_url: "https://upload.wikimedia.org/wikipedia/commons/8/86/Chevron_Logo.svg"
              )
Customer.create(name: "Exxon",
                image_url: "https://upload.wikimedia.org/wikipedia/commons/f/fd/Exxon_logo_2016.svg"
              )
Customer.create(name: "Total",
                image_url: "http://logok.org/wp-content/uploads/2014/05/Total-logo-earth-880x660.png"
              )
Customer.create(name: "BP",
                image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/d/d2/BP_Helios_logo.svg/125px-BP_Helios_logo.svg.png"
              )

10.times do
  Software.create(title: Faker::App.name,
                  image_url: Faker::Company.logo,
                  description: Faker::TvShows::RickAndMorty.quote,
                  price: Faker::Number.between(from: 120.0, to: 1344.22).truncate(2),
                  longitude: Faker::Address.longitude,
                  latitude: Faker::Address.latitude,
                  address: Faker::Address.street_address,
                  customer_id: Faker::Number.between(from: 1, to: 4)
                )
end

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(email: Faker::Internet.email(name: "#{first_name} #{last_name}"),
              password: Faker::Internet.password,
              first_name: first_name,
              last_name: last_name)
end

10.times do
  Release.create(version_number: Faker::App.version,
                 software_url: Faker::Internet.url,
                 software_id: Faker::Number.between(from: 0, to: 99),
                 user_id: Faker::Number.between(from: 0, to: 9))
end

10.times do
  Review.create(comment: "#{Faker::Quotes::Shakespeare.romeo_and_juliet} #{Faker::SlackEmoji.emoji}",
                rating: Faker::Number.between(from: 0, to: 5),
                user_id: Faker::Number.between(from: 0, to: 9),
                release_id: Faker::Number.between(from: 0, to: 99))
end
