class AddProbabilityToGame < ActiveRecord::Migration
  def change
    add_column :games, :home_probability, :float
    add_column :games, :visitor_probability, :float
  end
end
