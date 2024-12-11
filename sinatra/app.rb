require 'sinatra'
require 'sinatra/activerecord'
require './models/recipe'
require './models/category'

set :database_file, 'config/database.yml'

get '/' do
    @recipes = Recipe.all
    erb :index
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
  erb :new  
end
  
# В вашем контроллере (например, в app.rb)
require 'sinatra'
require 'fileutils'

post '/recipes' do
  recipe_data = params[:recipe]
  
  # Обработка изображения, если оно было загружено
  if params[:recipe][:image] && params[:recipe][:image][:tempfile]
    # Сохранение изображения в папку uploads
    image_filename = params[:recipe][:image][:filename]
    image_path = "public/uploads/#{image_filename}"
    FileUtils.cp(params[:recipe][:image][:tempfile], image_path)

    # Создание нового рецепта с путем к изображению
    recipe = Recipe.new(
      title: recipe_data[:title],
      ingredients: recipe_data[:ingredients],
      instructions: recipe_data[:instructions],
      preparation_time: recipe_data[:preparation_time],
      difficulty: recipe_data[:difficulty],
      category_id: recipe_data[:category_id],
      image_url: "/uploads/#{image_filename}" # Сохраняем путь к изображению
    )
  else
    # Если изображение не загружено, сохраняем рецепт без изображения
    recipe = Recipe.new(
      title: recipe_data[:title],
      ingredients: recipe_data[:ingredients],
      instructions: recipe_data[:instructions],
      preparation_time: recipe_data[:preparation_time],
      difficulty: recipe_data[:difficulty],
      category_id: recipe_data[:category_id]
    )
  end

  # Сохранение рецепта в базу данных
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

  get '/recipes' do
    if params[:difficulty]
      @recipes = Recipe.where(difficulty: params[:difficulty])
    else
      @recipes = Recipe.all
    end
    erb :index
  end

  get '/search' do
    # Получаем значение запроса из формы
    query = params[:query]
    
    # Если есть запрос, ищем рецепты по названию
    if query && !query.empty?
        @recipes = Recipe.where("title LIKE ?", "%#{query}%")
    else
        # Если запрос пустой, показываем все рецепты
        @recipes = Recipe.all
    end

    # Отображаем страницу с рецептами
    erb :index  # Или другой шаблон, который отображает рецепты
end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
end
