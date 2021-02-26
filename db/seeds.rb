require 'json'
require 'open-uri'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "creating ingredients"
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "#{ingredient["strIngredient1"]} created!"
end

mint = Ingredient.create!(name: "mint")
puts "#{mint.name} created!"


# créer des cocktails
puts "creating cocktails"
mojito = Cocktail.create(name: "Mojito")
pina_colada = Cocktail.create(name: "Pina Colada")
margarita = Cocktail.create(name: "Margarita")
sex_on_the_beach = Cocktail.create(name: "Sex on the beach")
blue_lagoon = Cocktail.create(name: "Blue Lagoon")
cosmopolitan = Cocktail.create(name: "Cosmopolitan")

[mojito, pina_colada, margarita, sex_on_the_beach, blue_lagoon, cosmopolitan].each do |cocktail|
  puts "#{cocktail.name} created !"
end

puts "Finished!"
