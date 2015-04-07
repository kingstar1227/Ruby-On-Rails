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
unit1.vocable = v
