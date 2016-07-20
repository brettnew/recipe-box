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

post("/recipes") do
  name = params.fetch("recipe_name")
  Recipe.create({:name => name})
  redirect("/recipes")
end

get("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @tags = Tag.all()
  erb(:recipe)
end
