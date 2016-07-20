# require('spec_helper')
#
# describe('recipe functionality through application', {:type => :feature}) do
#   it('allows a user to add a new recipe') do
#     visit('/')
#     click_link('View Recipes')
#     fill_in('recipe_name', :with => "Ceaser Salad")
#     click_button('Add Recipe')
#     expect(page).to have_content('Ceaser Salad')
#   end
#
#   it('allows a user to view details for single recipe') do
#     visit('/recipes')
#     fill_in('recipe_name', :with => 'Chocolate Chip Cookies')
#     click_button('Add Recipe')
#     click_link('Chocolate Chip Cookies')
#     expect(page).to have_content('Recipe: Chocolate Chip Cookies')
#   end
#
#   it('allows a user to associate a tag with a recipe') do
#     visit('/tags')
#     fill_in('tag_description', :with => "desert")
#     click_button('Add Tag')
#     click_link('View Recipes')
#     fill_in('recipe_name', :with => "Apple Pie")
#     click_button('Add Recipe')
#     click_link('Apple Pie')
#     select("desert", :from => "tag_id")
#     click_button("Submit")
#     expect(page).to have_content('desert')
#   end
#
#   it('allows a user to associate a recipe with tags') do
#     visit('/recipes')
#     fill_in('recipe_name', :with => "Pasta Salad")
#     click_button('Add Recipe')
#     click_link('View Recipe Tags')
#     fill_in('tag_description', :with => "carbohydrates")
#     click_button('Add Tag')
#     click_link('carbohydrates')
#     select("Pasta Salad", :from => "recipe_id")
#     click_button("Submit")
#     expect(page).to have_content('Pasta Salad')
#   end
# end
