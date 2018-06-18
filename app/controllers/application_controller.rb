require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    if recipe.save
      redirect "/recipes/#{recipe.id}"
    end
  end

  get "/recipes/:id" do
    binding.pry
    @recipe_name = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.update(params[:name], params[:ingredients], params[:cook_time])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  post "/recipes/:id/delete" do
      @recipe1 = Recipe.find_by_id(params[:id])
      @recipe1.delete
  end

end
