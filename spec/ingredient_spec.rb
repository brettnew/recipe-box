require('spec_helper')

describe(Ingredient) do
  it('has recipes associated with ingredients') do
    test_ingredient = Ingredient.create({:name => "butter"})
    recipe1 = Recipe.create({:name => 'cookie'})
    recipe2 = Recipe.create({:name => 'cake'})
    test_ingredient.update({:recipe_ids => [recipe1.id(), recipe2.id()]})
    expect(test_ingredient.recipes()).to(eq([recipe1, recipe2]))
  end
end
