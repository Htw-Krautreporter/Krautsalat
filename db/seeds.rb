# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: 'admin@admin.de', username: 'Krautsalatkoch', password: 'password', admin: true)
user = User.create(email: 'user@user.de', username: 'Krautsalatgourmet', password: 'password', admin: false)

topic = Topic.create(
	title: "Fucking Fried Chicken",
	description: "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you.",
	user: admin)

user2 = topic.users.create(email: 'user2@user.de', username: 'Krautsalatfan', password: 'password', admin: false)
user3 = topic.users.create(email: 'user3@user.de', username: 'Krautsalatesser', password: 'password', admin: false)

topic2 = Topic.create(
	title: "Bla Bla",
	description: "But you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you.",
	user: admin)

