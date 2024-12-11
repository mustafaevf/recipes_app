require 'sinatra'
require 'sinatra/activerecord'
require './models/recipe'
require './models/category'

set :database_file, 'config/database.yml'

# Не нужно явно вызывать run Sinatra::Application, Sinatra делает это автоматически.

get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
 
get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


# Отображение формы для редактирования рецепта
get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  # Обработка изменений и обновление рецепта
  put '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    if recipe.update(
      title: params[:title],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
      preparation_time: params[:preparation_time],
      difficulty: params[:difficulty],
      category_id: params[:category_id]
    )
      redirect "/recipes/#{recipe.id}"
    else
      erb :edit
    end
  end
  
# Показать форму для добавления нового рецепта
get '/recipes/new' do
    erb :new  # Показывает страницу с формой
  end
  
  # Добавить новый рецепт
  post '/recipes' do
    recipe_data = params[:recipe]
    recipe = Recipe.new(
      title: recipe_data[:title],
      ingredients: recipe_data[:ingredients],
      instructions: recipe_data[:instructions],
      preparation_time: recipe_data[:preparation_time],
      difficulty: recipe_data[:difficulty],
      category_id: recipe_data[:category_id]
    )
  
    if recipe.save
      redirect '/'  # После сохранения редиректим на главную страницу
    else
      "Ошибка при добавлении рецепта"
    end
  end

# Удаление рецепта
delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect '/'
  end