class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :measurement
      t.integer :amount
      t.integer :recipe_id 
    end
  end
end