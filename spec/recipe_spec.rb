require('spec_helper')

describe(Recipe) do
  it('has tags associated with it') do
    test_recipe = Recipe.create({:name =>"cookies"})
    tag1 = Tag.create({:description => 'bad!'})
    tag2 = Tag.create({:description => 'great!'})
    test_recipe.update({:tag_ids => [tag1.id(), tag2.id()]})
    expect(test_recipe.tags()).to(eq([tag1, tag2]))
  end

it('has ingredients associated with it') do
  test_recipe = Recipe.create({:name =>"cookies"})
  ingredient1 = Ingredient.create({:name => 'milk'})
  ingredient2 = Ingredient.create({:name => 'butter'})
  test_recipe.update({:ingredient_ids => [ingredient1.id(), ingredient2.id()]})
  expect(test_recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end
end
