# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: 'admin@admin.de', username: 'Krautsalatkoch', password: 'password', rights: 2, expertise: 'Computer, IT')
author = User.create(email: 'author@author.de', username: 'Krautsalatservierer', password: 'password', rights: 1, expertise: 'Science Fiction, Luftfahrt')
user = User.create(email: 'user@user.de', username: 'Krautsalatgourmet', password: 'password', expertise: 'Flugzeug, Luftfahrt')

topic = Topic.create(
	title: "Candy sweet roll",
	description: "Danish jelly tart macaroon sweet roll sugar plum powder halvah. Tart liquorice I love candy gummi bears. Marzipan chupa chups cotton candy cookie muffin. Dragée halvah soufflé pie jelly-o I love ice cream. Soufflé ice cream fruitcake chocolate.",
	user: admin)

user2 = topic.users.create(email: 'user2@user.de', username: 'Krautsalatfan', password: 'password', expertise: 'Fußball')
user3 = topic.users.create(email: 'user3@user.de', username: 'Krautsalatesser', password: 'password', expertise: 'Gastronomie, Hotel, Reise')

topic2 = Topic.create(
	title: "Ice cream brownie donut",
	description: "I love caramels gingerbread brownie chocolate bar liquorice I love carrot cake. Powder I love soufflé. Sugar plum dessert gingerbread I love lemon drops gingerbread lemon drops gummi bears. Halvah sugar plum chupa chups I love jelly beans. Apple pie I love croissant tart muffin chupa chups. Topping dessert dessert cupcake. Oat cake lollipop tiramisu dragée. Marzipan brownie sweet roll I love caramels marshmallow bonbon.",
	user: admin)

topic3 = Topic.create(
	title: "Muffin sweet macaroon",
	description: "Sesame snaps powder lemon drops jelly-o chocolate bar I love. Cheesecake pudding bonbon pudding ice cream. Sesame snaps bonbon candy toffee. Topping tiramisu ice cream chocolate. Pastry dessert jelly beans I love macaroon candy dessert cotton candy. ",
	user: author)