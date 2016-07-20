require('spec_helper')

describe(Tag) do
  it('has recipes associated with tags') do
    test_tag = Tag.create({:description =>" salad"})
    recipe1 = Recipe.create({:name => 'caesar salad'})
    recipe2 = Recipe.create({:name => 'burritos'})
    test_tag.update({:recipe_ids => [recipe1.id()]})
    expect(test_tag.recipes()).to(eq([recipe1]))
  end
end
