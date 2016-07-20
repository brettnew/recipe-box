require('spec_helper')

describe('recipe functionality through application', {:type => :feature}) do
  it('allows a user to add a new recipe') do
    visit('/')
    click_link('View Recipes')
    fill_in('recipe_name', :with => "Ceaser Salad")
    click_button('Add Recipe')
    expect(page).to have_content('Ceaser Salad')
  end

end
