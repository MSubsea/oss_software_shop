require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all

puts "Adding 4 customers..."
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/8/86/Chevron_Logo.svg')
customer = Customer.create(name: "Chevron")
customer.photo.attach(io: file, filename: 'Chevron_Logo.svg', content_type: 'image/svg')

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/f/fd/Exxon_logo_2016.svg')
customer = Customer.create(name: "Exxon")
customer.photo.attach(io: file, filename: 'Exxon_Logo.svg', content_type: 'image/svg')

file = URI.open('http://logok.org/wp-content/uploads/2014/05/Total-logo-earth-880x660.png')
customer = Customer.create(name: "Total")
customer.photo.attach(io: file, filename: 'Total_Logo.svg', content_type: 'image/png')

file = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/d/d2/BP_Helios_logo.svg/125px-BP_Helios_logo.svg.png')
customer = Customer.create(name: "BP")
customer.photo.attach(io: file, filename: 'BP_Logo.svg', content_type: 'image/png')

puts "Adding 10 softwares..."
10.times do
  file = URI.open('https://source.unsplash.com/random')
  software = Software.create(title: Faker::App.name,
                  description: Faker::TvShows::RickAndMorty.quote,
                  price: Faker::Number.between(from: 120.0, to: 1344.22).truncate(2),
                  longitude: Faker::Address.longitude,
                  latitude: Faker::Address.latitude,
                  address: Faker::Address.street_address,
                  customer_id: Faker::Number.between(from: 1, to: 4)
                )
  software.photo.attach(io: file, filename: 'random.jpg', content_type: 'image/jpg')
end

puts "Adding 10 users..."
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(email: Faker::Internet.email(name: "#{first_name} #{last_name}"),
              password: Faker::Internet.password,
              first_name: first_name,
              last_name: last_name)
end

puts "Adding 10 releases..."
10.times do
  Release.create(version_number: Faker::App.version,
                 software_url: Faker::Internet.url,
                 software_id: Faker::Number.between(from: 0, to: 99),
                 user_id: Faker::Number.between(from: 0, to: 9))
end

puts "Adding 10 reviews..."
10.times do
  Review.create(comment: "#{Faker::Quotes::Shakespeare.romeo_and_juliet} #{Faker::SlackEmoji.emoji}",
                rating: Faker::Number.between(from: 0, to: 5),
                user_id: Faker::Number.between(from: 0, to: 9),
                release_id: Faker::Number.between(from: 0, to: 99))
end

puts "Seeding done!"
