class AddUserColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :USER_id, :integer
    remove_column :recipes, :cook_time, :string
  end
end
