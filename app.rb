require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all()
  erb(:recipes)
end

get("/tags") do
  @tags = Tag.all()
  erb(:tags)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/recipes") do
  name = params.fetch("recipe_name")
  recipe = Recipe.new({:name => name, :id => nil})
  @recipe = recipe
  @recipes = Recipe.all()
  if recipe.save()
    redirect("/recipes")
  else
    erb(:recipe_errors)
  end
end

post("/tags") do
  description = params.fetch("tag_description")
  Tag.create({:description => description})
  redirect("/tags")
end

post("/ingredients") do
  name = params.fetch("ingredient_name")
  Ingredient.create({:name => name})
  redirect('/ingredients')
end

get("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end

get("/tags/:id") do
  @tag = Tag.find(params.fetch("id").to_i())
  @recipes = Recipe.all
  erb(:tag)
end

get('/ingredients/:id') do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  @recipes = Recipe.all()
  erb(:ingredient)
end

patch("/recipes/:id/ingredient") do
  ingredient = Ingredient.find(params.fetch("ingredient_id").to_i())
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.ingredients.push(ingredient)
  redirect back
end

patch("/recipes/:id/tag") do
  tag = Tag.find(params.fetch("tag_id").to_i())
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.tags.push(tag)
  redirect back
end

patch("/tags/:id") do
  recipe = Recipe.find(params.fetch("recipe_id").to_i())
  @tag = Tag.find(params.fetch("id").to_i())
  @tag.recipes.push(recipe)
  redirect back
end

patch('/recipes/:id') do
  instructions = params.fetch("instructions")
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:instructions => instructions})
  @recipes = Recipe.all()
  redirect back
end




get("/clear") do
  Tag.all().each() do |tag|
    tag.destroy()
  end
  Recipe.all().each() do |recipe|
    recipe.destroy()
  end
  Ingredient.all().each() do |ingredient|
    ingredient.destroy()
  end
  redirect("/")
end
