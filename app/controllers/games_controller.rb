class GamesController < ApplicationController
  
  
  def index
    @allGames = Game.todays_games;
    render :index
  end

  def show
    @game = Game.find_by_id(params[:id])
    @allGames = Game.todays_games;
    render :show
  end

  def new
  end

  def create
  end

 


end
