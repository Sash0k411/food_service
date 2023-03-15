menu = YAML::load_file(Rails.root.join('menu.yml'))

menu['ingredients'].each do |ingredient|
  Ingredient.create!(name: ingredient.downcase)
end

menu['dishes'].each do |data|
  dish = Dish.create!(name: data['name'])

  data['ingredients'].each do |ingredient|
    OriginalIngredient.create!(dish:, ingredient: Ingredient.find_by(name: ingredient.downcase))
  end
end