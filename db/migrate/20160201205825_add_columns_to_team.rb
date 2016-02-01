class AddColumnsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :name, :string
    add_column :teams, :conference, :string
    add_column :teams, :rank, :integer
    add_column :teams, :wins, :integer
    add_column :teams, :losses, :integer
    add_column :teams, :pts_per_game, :integer
    add_column :teams, :reb_per_game, :integer
    add_column :teams, :asst_per_game, :integer
  end
end
