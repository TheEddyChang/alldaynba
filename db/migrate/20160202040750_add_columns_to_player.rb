class AddColumnsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :home, :string
    add_column :players, :TEAM_ID, :integer
  end
end
