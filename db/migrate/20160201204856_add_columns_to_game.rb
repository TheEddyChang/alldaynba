class AddColumnsToGame < ActiveRecord::Migration
  def change
    add_column :games, :date, :integer
    add_column :games, :home_points, :integer
    add_column :games, :visiting_points, :integer
    add_column :games, :time_of_game, :string
    add_column :games, :home_teamID, :integer
    add_column :games, :visit_teamID, :integer

  end
end


