class ChangeIntegerColumnsToFloat < ActiveRecord::Migration
  def change
    
    change_column :players, :fg_percent, :float
    change_column :players, :fg3_percent, :float
    change_column :players, :ft_percent, :float
    change_column :players, :reb, :float
    change_column :players, :assist, :float
    change_column :players, :tov, :float
    change_column :players, :stl, :float
    change_column :players, :blk, :float
    change_column :players, :pts, :float

    change_column :teams, :pts_per_game, :float
    change_column :teams, :reb_per_game, :float
    change_column :teams, :asst_per_game, :float
  end
end
