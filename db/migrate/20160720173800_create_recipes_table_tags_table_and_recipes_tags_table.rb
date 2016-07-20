class CreateRecipesTableTagsTableAndRecipesTagsTable < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:ingredients, :string)
      t.column(:instructions, :text)
      t.column(:rating, :integer)
    end

    create_table(:tags) do |t|
      t.column(:description, :string)
    end

    create_table(:recipes_tags) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)
    end  
  end
end
