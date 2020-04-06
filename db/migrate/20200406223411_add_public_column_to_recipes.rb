class AddPublicColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :public, :boolean, :default => true
  end
end
