# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


collection = Collection.create!(title: "Cat Collection", created_by: "Ahmad")

cat = Cat.create!(name: "Snowy", sex: "Female", colour: "White", favouritefood: "Dominos Garlic Dip", collection_id: collection.id)
