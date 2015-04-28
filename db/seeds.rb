# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

v = Vocable.create([{german: 'hallo', english: 'hello', swedish: 'hej'},
                   {german: 'hi', english: 'hi', swedish: 'tjena'},
                   {german: 'sehr gut', english: 'very good', swedish: 'jättebra'}]
                   )

unit1 = Unit.create(name: 'First Unit. Greetings')
unit1.vocables = v

unit_subscription = UnitSubscription.create(unit_id: unit1.id)

user = User.create(email:"user@test.de", password: "useruser", password_confirmation: "useruser", admin: false )
admin = User.create(email:"admin@test.de", password: "adminadmin", password_confirmation: "adminadmin", admin: true )
