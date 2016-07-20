require('spec_helper')

describe(Recipe) do
  it('has tags associated with it') do
    test_recipe = Recipe.create({:name =>"cookies"})
    tag1 = Tag.create({:description => 'bad!'})
    tag2 = Tag.create({:description => 'great!'})
    test_recipe.update({:tag_ids => [tag1.id(), tag2.id()]})
    expect(test_recipe.tags()).to(eq([tag1, tag2]))
  end
end
