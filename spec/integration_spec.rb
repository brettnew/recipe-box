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
    fill_in('recipe_name', :with => 'Caesar Salad')
    click_button('Add Recipe')
    click_link('Caesar Salad')
    expect(page).to have_content('Recipe: Caesar Salad')
  end

  it('allows a user to associate a tag with a recipe') do
    visit('/tags')
    fill_in('tag_description', :with => "salad")
    click_button('Add Tag')
    click_link('View Recipes')
    fill_in('recipe_name', :with => "Ceasar Salad")
    click_button('Add Recipe')
    click_link('Ceaser Salad')
    select("salad", :from => "tag_id")
    click_button("Submit")
    expect(page).to have_content('salad')
  end
end
