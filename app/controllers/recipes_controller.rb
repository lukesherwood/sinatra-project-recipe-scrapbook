class RecipesController < ApplicationController

  #index shows all public recipes
  get "/recipes" do
    not_logged_in_redirect
    @recipes = Recipe.all
    erb :"/recipes/index"
  end

  get "/recipes/new" do
    not_logged_in_redirect
    @measurements = ["cup", "teaspoon", "tablespoon", "each", "grams", "ounces", "lbs"]
    erb :"/recipes/new"
  end

  #for new recipes
  post "/recipes" do
    @recipe = Recipe.new(name: params[:name], method: params[:method], public: params[:public])
    @recipe.user = current_user
    if !@recipe.save
      @errors = @recipe.errors.full_messages
      erb :"/recipes/new"
    end
    params[:ingredient].each do |ingredient_hash|
        @ingredient = Ingredient.new(ingredient_hash)
        @ingredient.recipe_id = @recipe.id
        if !@ingredient.save
          @errors = @ingredient.errors.full_messages
          erb :"/recipes/new"
        end
    end
    redirect "/recipes/#{@recipe.id}"
  end
  
  get "/recipes/:id" do
    not_logged_in_redirect
    @recipe = Recipe.all.find(params[:id])
    erb :"/recipes/show"
  end

  
  get "/recipes/:id/edit" do
    not_logged_in_redirect
    @measurements = ["cup", "teaspoon", "tablespoon", "each", "grams", "ounces", "lbs"]
    @recipe = Recipe.find(params[:id])
    authorized_to_change?(@recipe)
    erb :"/recipes/edit"
  end

  #for editing recipes
  post "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], method: params[:method], public: params[:public])
    if !@recipe.save
      @errors = @recipe.errors.full_messages
      erb :"/recipes/edit"
    end
    params[:ingredient].each_with_index do |ingredient_hash, index|
      @ingredient = @recipe.ingredients[index]
      @ingredient.update(name: ingredient_hash[:name], amount: ingredient_hash[:amount], measurement: ingredient_hash[:measurement])
      if !@ingredient.save
        @errors = @ingredient.errors.full_messages
        erb :"/recipes/new"
      end
  end
  redirect "/recipes/#{@recipe.id}"
  end
 
  get "/recipes/:id/delete" do
    not_logged_in_redirect
    @recipe = Recipe.all.find(params[:id])
    authorized_to_change?(@recipe)
    @recipe.destroy
    redirect "/recipes"
  end

  
end
