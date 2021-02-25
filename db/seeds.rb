require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "creating ingredients"
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "#{ingredient["strIngredient1"]} created!"
end

puts "Finished!"
