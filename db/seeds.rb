# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

#You will notice that we wrapped our creations with ActiveRecord::Base.transaction. This is because if any of the creation raises an error, the previous creation will be rolled back (i.e. the database will be returned to the previous state
ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    # user['gender'] = rand(1..2)
    # user['phone'] = Faker::PhoneNumber.phone_number
    # user['country'] = Faker::Address.country
    # user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end

User.create(first_name: "Isabel", last_name: "Teh", email: "a@a.com", password: "123456", role: 0)
User.create(first_name: "Isabel", last_name: "Teh", email: "b@b.com", password: "123456", role: 1)
User.create(first_name: "Isabel", last_name: "Teh", email: "c@c.com", password: "123456", role: 2)

# # Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::Hipster.sentence
    # listing['place_type'] = rand(1..3)
    listing['description'] = Faker::Hipster.sentence
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['num_of_rooms'] = rand(1..5)
    listing['num_of_bathrooms'] = rand(1..5)
    listing['price'] = rand(80..500)
    listing['house_rules'] = Faker::Hipster.sentence
    
    listing['street_address'] = Faker::Address.street_address
    listing['zipcode'] = Faker::Address.zip_code
    listing['city'] = Faker::Address.city
    listing['state'] = Faker::Address.state
    listing['country'] = Faker::Address.country
    listing['max_num_of_guests'] = rand(1..10)
    listing['check_in_time'] = "2p.m."
    listing['check_out_time'] = "12p.m."




    listing['user_id'] = uids.sample
    puts "creating"
    object = Listing.create!(listing)
    object.remote_photos_urls = (rand(1..4).times.map { Faker::Placeholdit.image })
    object.save
  end
end