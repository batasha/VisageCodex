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

jon = User.create(
  first_name: "Jon",
  last_name: "Snow",
  password: "qweasd123",
  email: "jon@snow.com",
  profile: Profile.create({gender: "male"})
 )
jon.avatar = File.new(File.join('public/images/jon-snow.jpg'))
jon.save!

tyrion = User.create(
  first_name: "Tyrion",
  last_name: "Lannister",
  password: "qweasd123",
  email: "tyrion@lannister.com",
  profile: Profile.create({gender: "male"})
 )
tyrion.avatar = File.new(File.join('public/images/tyrion-lannister.jpg'))
tyrion.save!

jaime = User.create(
  first_name: "Jaime",
  last_name: "Lannister",
  password: "qweasd123",
  email: "jaime@lannister.com",
  profile: Profile.create({gender: "male"})
 )
jaime.avatar = File.new(File.join('public/images/jaime-lannister.jpg'))
jaime.save!

tywin = User.create(
  first_name: "Tywin",
  last_name: "Lannister",
  password: "qweasd123",
  email: "tywin@lannister.com",
  profile: Profile.create({gender: "male"})
 )
tywin.avatar = File.new(File.join('public/images/tywin-lannister.jpg'))
tywin.save!

cersei = User.create(
  first_name: "Cersei",
  last_name: "Lannister",
  password: "qweasd123",
  email: "cersei@lannister.com",
  profile: Profile.create({gender: "female"})
 )
cersei.avatar = File.new(File.join('public/images/cersei-lannister.jpg'))
cersei.save!

marg = User.create(
  first_name: "Margaery",
  last_name: "Tyrell",
  password: "qweasd123",
  email: "margaery@tyrell.com",
  profile: Profile.create({gender: "female"})
 )
marg.avatar = File.new(File.join('public/images/margaery-tyrell.jpg'))
marg.save!

friends = Friendship.create([
  {user_id: 1, friend_id: 2}, {user_id: 2, friend_id: 1},
  {user_id: 3, friend_id: 4}, {user_id: 4, friend_id: 3},
  {user_id: 4, friend_id: 6}, {user_id: 6, friend_id: 4},
  {user_id: 4, friend_id: 5}, {user_id: 5, friend_id: 4},
  {user_id: 5, friend_id: 6}, {user_id: 6, friend_id: 5}
])

requests = FriendRequest.create([
  {sender_id: 3, recipient_id: 2, status: "pending"},
  {sender_id: 7, recipient_id: 6, status: "pending"},
  {sender_id: 3, recipient_id: 5, status: "pending"}
])

posts = Post.create([
  {text: "Freezing on the Wall", sender_id: 2, recipient_id: 2 },
])

comments = Comment.create([
  {text: "Miss you!", user_id: 1, post_id: 1}
])

