class GamesController < ApplicationController
  
  
  def index
    @allGames = Game.todays_games;
    render :index

  end

  def show
    @playerInfo = ;#all players from team 
  
    
    
  end


  def new
  end

  def create
  end

 


end
