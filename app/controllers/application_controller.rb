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
      raise recipe.inspect
      redirect "/recipes/#{recipe.id}"
    end
  end
  #
  # get "/recipes/:id" do
  #   @recipe = Recipe.find_by_id(params[:id])
  #   erb :show
  # end
  #
  #
  #
  # get "/recipes/:id/edit" do
  #   @recipe = Recipe.find_by_id(params[:id])
  #   erb :edit
  # end
  #
  # patch "/recipes/:id/edit" do
  #   @recipe = Recipe.update(params[:name], params[:ingredients], params[:cook_time])
  #   @recipe.save
  #   erb :show
  # end
  #
  # post "/recipes/:id/delete" do
  #     @recipe = Recipe.find_by_id(params[:id])
  #     @recipe.delete
  # end

end
