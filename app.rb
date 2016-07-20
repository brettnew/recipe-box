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

patch("/recipes/:id") do
  tag = Tag.find(params.fetch("tag_id").to_i())
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.tags.push(tag)
  redirect back
end
