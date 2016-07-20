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

post("/recipes") do
  name = params.fetch("recipe_name")
  Recipe.create({:name => name})
  redirect("/recipes")
end

post("/tags") do
  description = params.fetch("tag_description")
  Tag.create(({:description => description}))
  redirect("/tags")
end

get("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @tags = Tag.all()
  erb(:recipe)
end

get("/tags/:id") do
  @tag = Tag.find(params.fetch("id").to_i())
  @recipes = Recipe.all
  erb(:tag)
end

patch("/recipes/:id") do
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





get("/clear") do
  Tag.all().each() do |tag|
    tag.destroy()
  end
  Recipe.all().each() do |recipe|
    recipe.destroy()
  end
  redirect("/")
end
