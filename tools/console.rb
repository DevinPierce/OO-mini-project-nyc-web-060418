require_relative '../config/environment.rb'

joe = User.new('Joe')
jill = User.new('Jill')

flour = Ingredient.new('Flour')
eggs = Ingredient.new('Eggs')
milk = Ingredient.new('Milk')
chocoloate_chips = Ingredient.new('Chocoloate Chips')

joe.declare_allergens(milk)

cake = Recipe.new('Cake')
cake.add_ingredients([flour, eggs, milk])

cookies = Recipe.new('Cookies')
cookies.add_ingredients([flour, eggs, milk, chocoloate_chips])

cupcakes = Recipe.new('Cupcakes')
cupcakes.add_ingredients([flour, eggs, milk, chocoloate_chips])

bread = Recipe.new('Bread')
bread.add_ingredients([flour, eggs, milk])

cake_recipe_card = RecipeCard.new(joe, cake, '6/1', 5)
cake_recipe_card2 = RecipeCard.new(jill, cake, '7/13', 5)
cookies_recipe_card = RecipeCard.new(jill, cookies, '6/1', 4)
cupcakes_recipe_card = RecipeCard.new(jill, cupcakes, '6/1', 3)
bread_recipe_card = RecipeCard.new(jill, bread, '6/1', 1)


binding.pry
