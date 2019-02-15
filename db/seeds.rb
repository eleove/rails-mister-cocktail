# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
Cocktail.destroy_all

require 'open-uri'
require 'json'

# Ingredient.create!(name: 'lemon')
# Ingredient.create!(name: 'ice')
# Ingredient.create!(name: 'mint leaves')

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
buffer = open(url).read
response = JSON.parse(buffer)
drinks = response['drinks']
ten_drinks = drinks.sample(10)

ten_drinks.each_with_index do |drink, i|
  Ingredient.create!(name: drink['strIngredient1'])
end

cocktail0 = Cocktail.create!(name: 'Mojito')
cocktail1 = Cocktail.create!(name: 'Martini')
cocktail2 = Cocktail.create!(name: 'Mulberry Sour')
cocktail3 = Cocktail.create!(name: 'Pina Colada')
cocktail4 = Cocktail.create!(name: 'Tequila Sunrise')
cocktail5 = Cocktail.create!(name: 'Sex on the Beach')
cocktail6 = Cocktail.create!(name: 'Daiquiri')
cocktail7 = Cocktail.create!(name: 'Moscow Mule')
cocktail8 = Cocktail.create!(name: 'Margarita')
cocktail9 = Cocktail.create!(name: 'Old Fashioned')

ingredients = Ingredient.all

Dose.create!(description: '6cl', cocktail: cocktail1, ingredient: ingredients[1])
Dose.create!(description: '3cl', cocktail: cocktail1, ingredient: ingredients[3])
Dose.create!(description: '2cl', cocktail: cocktail1, ingredient: ingredients[7])
Dose.create!(description: '5cl', cocktail: cocktail2, ingredient: ingredients[1])
Dose.create!(description: '5cl', cocktail: cocktail2, ingredient: ingredients[2])
Dose.create!(description: '9cl', cocktail: cocktail3, ingredient: ingredients[6])
Dose.create!(description: '1cl', cocktail: cocktail3, ingredient: ingredients[7])
Dose.create!(description: '2cl', cocktail: cocktail4, ingredient: ingredients[7])
Dose.create!(description: '3cl', cocktail: cocktail4, ingredient: ingredients[1])
Dose.create!(description: '9cl', cocktail: cocktail5, ingredient: ingredients[8])
Dose.create!(description: '3cl', cocktail: cocktail6, ingredient: ingredients[5])
Dose.create!(description: '1cl', cocktail: cocktail7, ingredient: ingredients[3])
Dose.create!(description: '5cl', cocktail: cocktail8, ingredient: ingredients[2])
Dose.create!(description: '7cl', cocktail: cocktail9, ingredient: ingredients[1])
Dose.create!(description: '3cl', cocktail: cocktail0, ingredient: ingredients[4])
