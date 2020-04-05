class RecipesController < ApplicationController

  #shows all public recipes
  get "/recipes" do
    @recipes = RECIPE.all
    erb :"/recipes/index"
  end


  get "/recipes/new" do
    erb :"/recipes/new"
  end

  #for new recipes
  post "/recipes" do
      @recipe = RECIPE.new(params)
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    
  end

  
  get "/recipes/:id" do
    @recipe = RECIPE.all.find(params[:id])
    erb :"/recipes/show"
  end

  
  get "/recipes/:id/edit" do
    erb :"/recipes/edit"
  end

  #edit
  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

 
  get "/recipes/:id/delete" do
    RECIPE.all.find(params[:id]).destroy
    redirect "/recipes"
  end

  
end
