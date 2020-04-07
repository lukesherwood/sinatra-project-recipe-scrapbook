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
      @recipe = Recipe.new(params)
      @recipe.user = current_user
      if @recipe.save
        redirect "/recipes/#{@recipe.id}"
      else
        @errors = @recipe.errors.full_messages
        erb :"/recipes/new"
      end
  end

  
  get "/recipes/:id" do
    not_logged_in_redirect
    @recipe = Recipe.all.find(params[:id])
    erb :"/recipes/show"
  end

  
  get "/recipes/:id/edit" do
    not_logged_in_redirect
    @recipe = Recipe.find(params[:id])
    authorized_to_change?(@recipe)
    erb :"/recipes/edit"
  end

  #for editing recipes
  post "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(ingredients: params[:ingredients], name: params[:name], method: params[:method], public: params[:public])
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      @errors = @recipe.errors.full_messages
      erb :"/recipes/edit"
    end
  end
 
  get "/recipes/:id/delete" do
    not_logged_in_redirect
    @recipe = Recipe.all.find(params[:id])
    authorized_to_change?(@recipe)
    @recipe.destroy
    redirect "/recipes"
  end

  
end
