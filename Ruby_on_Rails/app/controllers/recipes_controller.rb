class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
    @categories = Category.all
    render :index
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @categories = Category.all
    render :form # Загрузит форму show.html.erb
  end

  # GET /recipes/:id
  def show
    render :show
  end

  # POST /recipes
  def create
    @categories = Category.all
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Рецепт был успешно добавлен.'
    else
      render :form
    end
  end


  # PUT /recipes/:id
  def update
    if @recipe.update(recipe_params)
      render json: @recipe, status: :ok
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.destroy
    head :no_content
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Рецепт не найден' }, status: :not_found
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :preparation_time, :difficulty, :category_id, :image_url)
  end

end
