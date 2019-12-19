require 'json'
require 'open-uri'

puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?

puts "Create ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
# Ingredient.destroy_all

# puts 'Creating ingredients...'
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "soda water")
# Ingredient.create(name: "tonic")
# Ingredient.create(name: "lime")
# Ingredient.create(name: "sugar")
# Ingredient.create(name: "rum")
# Ingredient.create(name: "")
# Ingredient.create(name: "")
# Ingredient.create(name: "")
# Ingredient.create(name: "")
# Ingredient.create(name: "")
# Ingredient.create(name: "")
# Ingredient.create(name: "")
# puts 'Finished!'
