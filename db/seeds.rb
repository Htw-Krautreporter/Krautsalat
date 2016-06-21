# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create(email: 'admin@admin.de', username: 'Krautsalatkoch', password: 'password', admin: true)
user = User.create(email: 'user@user.de', username: 'Krautsalatgourmet', password: 'password', admin: false)