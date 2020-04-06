class RecipesController < ApplicationController

  #shows all public recipes
  get "/recipes" do
    not_logged_in_redirect
    @recipes = RECIPE.all
    erb :"/recipes/index"
  end

  get "/recipes/new" do
    not_logged_in_redirect
    erb :"/recipes/new"
  end

  #for new recipes
  post "/recipes" do
      @recipe = RECIPE.new(params)
      @recipe.USER = current_user
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    
  end

  
  get "/recipes/:id" do
    not_logged_in_redirect
    @recipe = RECIPE.all.find(params[:id])
    erb :"/recipes/show"
  end

  
  get "/recipes/:id/edit" do
    not_logged_in_redirect
    @recipe = RECIPE.find(params[:id])
    authorized_to_change?(@recipe)
    erb :"/recipes/edit"
  end

  #edit
  post "/recipes/:id" do
    @recipe = RECIPE.find(params[:id])
    @recipe.update(ingredients: params[:ingredients], name: params[:name], method: params[:method], public: params[:public])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

 
  get "/recipes/:id/delete" do
    not_logged_in_redirect
    @recipe = RECIPE.all.find(params[:id])
    authorized_to_change?(@recipe)
    @recipe.destroy
    redirect "/recipes"
  end

  
end
