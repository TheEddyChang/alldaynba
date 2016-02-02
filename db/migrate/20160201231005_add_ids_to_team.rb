class AddIdsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :nba_id, :integer
    add_column :teams, :city, :string
  end
end
