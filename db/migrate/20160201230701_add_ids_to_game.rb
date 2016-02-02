class AddIdsToGame < ActiveRecord::Migration
  def change
    add_column :games, :nba_id, :integer
  end
end
