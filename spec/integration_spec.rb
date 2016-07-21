require('spec_helper')

describe('recipe functionality through application', {:type => :feature}) do
  it('allows a user to add a new recipe') do
    visit('/')
    click_link('View Recipes')
    fill_in('recipe_name', :with => "Ceaser Salad")
    click_button('Add Recipe')
    expect(page).to have_content('Ceaser Salad')
  end

  it('allows a user to view details for single recipe') do
    visit('/recipes')
    fill_in('recipe_name', :with => 'Chocolate Chip Cookies')
    click_button('Add Recipe')
    click_link('Chocolate Chip Cookies')
    expect(page).to have_content('Recipe: Chocolate Chip Cookies')
  end

  it('allows a user to associate a tag with a recipe') do
    visit('/tags')
    fill_in('tag_description', :with => "desert")
    click_button('Add Tag')
    click_link('View Recipes')
    fill_in('recipe_name', :with => "Apple Pie")
    click_button('Add Recipe')
    click_link('Apple Pie')
    select("desert", :from => "tag_id")
    click_button("Submit Tag")
    expect(page).to have_content('desert')
  end

  it('allows a user to associate a recipe with tags') do
    visit('/recipes')
    fill_in('recipe_name', :with => "Pasta Salad")
    click_button('Add Recipe')
    click_link('View Recipe Tags')
    fill_in('tag_description', :with => "carbohydrates")
    click_button('Add Tag')
    click_link('carbohydrates')
    select("Pasta Salad", :from => "recipe_id")
    click_button("Submit")
    expect(page).to have_content('Pasta Salad')
  end

  it('allows a user to associate an ingredient with a recipe') do
    visit('/recipes')
    fill_in('recipe_name', :with => "congee")
    click_button('Add Recipe')
    click_link('View Ingredients')
    fill_in('ingredient_name', :with => "chicken")
    click_button('Add Ingredient')
    click_link('View Recipes')
    click_link('congee')
    select("chicken", :from => "ingredient_id")
    click_button("Submit Ingredient")
    expect(page).to have_content('chicken')
  end

  it('allows a user to see recipes assoiciated with an ingredient') do
    visit('/recipes')
    fill_in('recipe_name', :with => "congee")
    click_button('Add Recipe')
    click_link('View Ingredients')
    fill_in('ingredient_name', :with => "chicken")
    click_button('Add Ingredient')
    click_link('View Recipes')
    click_link('congee')
    select('chicken', :from => 'ingredient_id')
    click_button('Submit Ingredient')
    click_link('View Ingredients')
    click_link('chicken')
    expect(page).to have_content('congee')
  end

  it('allows the user to delete a recipe') do
    Recipe.create({:name => "Hamburger"})
    visit('/recipes')
    click_link ('Edit')
    click_button ('Delete Recipe')
    expect(page).to have_no_content('Hamburger')
  end

  it('allows the user to edit a recipes name') do
    Recipe.create({:name => "donuts"})
    visit('/recipes')
    click_link ('Edit')
    fill_in('recipe_name', :with => "jelly donuts")
    click_button ('Update')
    expect(page).to have_content('jelly donuts')
  end

  it('allows the user to edit a recipes instructions') do
    Recipe.create({:name => "donuts", :instructions => "bake it", :id => 1})
    visit('/recipes')
    click_link ('Edit')
    fill_in('instructions', :with => "bake 20 mins")
    click_button ('Update Instructions')
    click_link ('donuts')
    expect(page).to have_content('bake 20 mins')
  end
end
