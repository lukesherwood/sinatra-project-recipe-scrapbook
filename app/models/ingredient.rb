class Ingredient < ActiveRecord::Base
    belongs_to :recipe
    validates :name, :measurement, :amount, presence: true
    
    def self.create_or_update_ingredients(ingredient_hashes_array, recipe)
        recipe.ingredients.clear
        ingredient_hashes_array.each do |ingredient_hash|
            if ingredient_hash[:name].present? && ingredient_hash[:amount].present?
                @ingredient = recipe.ingredients.build(ingredient_hash)
                @ingredient.save
            end
        end
    end

   
end

