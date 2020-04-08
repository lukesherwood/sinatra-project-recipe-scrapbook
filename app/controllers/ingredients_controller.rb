class IngredientsController < ApplicationController

    #gets from recipe/new
    post "/ingredients" do
         #params[ingredient] needs to be an array of hashes, so can iterate over array creating a new ingredient for each hash plus adding recipe_id = @recipe.id
         
    end
end