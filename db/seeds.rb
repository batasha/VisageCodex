# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
arya = User.create(
  first_name: "Arya",
  last_name: "Stark",
  password: "qweasd123",
  email: "arya@stark.com",
  profile: Profile.create({gender: "female"})
 )
arya.avatar = File.new(File.join('public/images/arya-stark.jpg'))
arya.save!