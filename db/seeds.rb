require 'faker'

3.times do
   User.create(
     name: Faker::Name.name,
     email: Faker::Internet.email)
 end

 3.times do
   Trip.create(
    name: Faker::Address.country,
    start_date: Faker::Date.backward,
    end_date: Faker::Date.forward,
    user_id: 1)
 end

 4.times do
   Leg.create(
    name: Faker::Address.country,
    start_date: Faker::Date.backward,
    end_date: Faker::Date.forward,
    trip_id: 1)
 end


  3.times do
   Leg.create(
    name: Faker::Address.country,
    start_date: Faker::Date.backward,
    end_date: Faker::Date.forward,
    trip_id: 2)
 end

 2.times do
   Leg.create(
    name: Faker::Address.country,
    start_date: Faker::Date.backward,
    end_date: Faker::Date.forward,
    trip_id: 3)
 end
