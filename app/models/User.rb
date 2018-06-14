class User

  attr_accessor :name

  @@all = []

  def initialize(name, allergens = [])
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    array = RecipeCard.all.select {|rc| rc.user == self}
    array.map {|rc| rc.recipe}
  end

  def declare_allergens(ingredient)
    new_allergen = Allergen.new(self, ingredient)
  end

  def allergens
    array = Allergen.all.select {|allergen| allergen.user == self}
    array.map {|allergen| allergen.ingredient}
  end

  def top_three_recipes
    array = RecipeCard.all.select {|rc| rc.user == self}
    array.sort_by {|rc| rc.rating * -1 }[0..2]
  end

  def most_recent_recipe

  end

end
