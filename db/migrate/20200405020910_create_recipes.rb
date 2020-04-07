class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :method
      t.integer :user_id
      t.boolean :public 
    end
  end
end
