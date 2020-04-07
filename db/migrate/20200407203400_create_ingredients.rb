class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :amount
      t.string :measurement
      t.integer :RECIPE_id
    end
  end
end
