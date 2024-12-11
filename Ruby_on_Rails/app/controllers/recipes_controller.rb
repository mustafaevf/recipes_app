class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]  # добавляем :edit
  before_action :set_categories, only: [:new, :edit, :create, :update] # добавляем категории в действия new и edit

  # GET /recipes
  def index
    @categories = Category.all

    if params[:title].present? && params[:category_id].present?
      @recipes = Recipe.where("title ILIKE ?", "%#{params[:title]}%").where(category_id: params[:category_id])
    elsif params[:title].present?
      @recipes = Recipe.where("title ILIKE ?", "%#{params[:title]}%")
    elsif params[:category_id].present?
      @recipes = Recipe.where(category_id: params[:category_id])
    else
      @recipes = Recipe.all
    end
    render :index
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    render :form
  end

  # GET /recipes/:id
  def show
    render :show
  end

  # GET /recipes/:id/edit
  def edit
    # @recipe уже загружен через set_recipe
  end

  # POST /recipes
  def create
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
      redirect_to @recipe, notice: 'Рецепт успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Рецепт был успешно удален.'
  end

  private

  # Устанавливаем рецепт для show, edit, update и destroy
  def set_recipe
    @recipe = Recipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to recipes_path, alert: 'Рецепт не найден.'
  end

  # Устанавливаем список категорий для new и edit
  def set_categories
    @categories = Category.all
  end

  # Разрешаем параметры рецепта
  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :preparation_time, :difficulty, :category_id, :image_url)
  end
end
