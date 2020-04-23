class RecipesController < ApplicationController
  
  before '/recipes/*' do
    not_logged_in_redirect
  end

  get "/recipes/new" do
    erb :"/recipes/new"
  end

  #for new recipes
  post "/recipes" do
    #refactor by turning into a method?
    @recipe = Recipe.new(name: params[:name], method: params[:method], public: params[:public])
    @recipe.user = current_user
    if !@recipe.save
      @errors = @recipe.errors.full_messages
      erb :"/recipes/new"
    end
    
    Ingredient.create_or_update_ingredients(params[:ingredient], @recipe)

    redirect "/recipes/#{@recipe.id}"
  end
  
  get "/recipes/:id" do
    @recipe = Recipe.all.find(params[:id])
    erb :"/recipes/show"
  end

  
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    authorized_to_change?(@recipe)
    erb :"/recipes/edit"
  end

  #for editing recipes
  post "/recipes/:id" do
    #updates recipe
    #refactor by turning into a method?
    @recipe = Recipe.find(params[:id])
    if !@recipe.update(name: params[:name], method: params[:method], public: params[:public])
      @errors = @recipe.errors.full_messages
      erb :"/recipes/edit"
    end
    Ingredient.create_or_update_ingredients(params[:ingredient], @recipe)
    
    redirect "/recipes/#{@recipe.id}"
  end
 
  get "/recipes/:id/delete" do
    @recipe = Recipe.all.find(params[:id])
    authorized_to_change?(@recipe)
    @recipe.destroy
    redirect "/users/#{current_user.id}"
  end

  
end
