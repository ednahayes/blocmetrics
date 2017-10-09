# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

 test_user = User.new(
   email: 'princessahe@hotmail.com', # replace this with your personal email
   password: 'helloworld'
  )
 
 test_user.skip_confirmation!
 test_user.save! 

  
 # Create Apps
 3.times do
   registerdapp = Registeredapp.create!(
    name:  Faker::App.name,
    url:   Faker::Internet.url,
    user:  test_user
   )
 end

 registeredapps = Registeredapp.all
 #registerdapps.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

events_array = ['click', 'view', 'download', 'upload', 'register']

 30.times do
     event = Event.create!(
        registeredapp: registeredapps.sample,
        name: events_array.sample
     )
 end
 events = Event.all
 
 
 puts "Seed finished"
 puts "#{Registeredapp.count} apps created"
 puts "#{Event.count} events created" 