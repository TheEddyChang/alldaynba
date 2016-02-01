class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :fg_percent
      t.integer :fg3_percent
      t.integer :ft_percent
      t.integer :reb
      t.integer :assist
      t.integer :tov
      t.integer :stl
      t.integer :blk
      t.integer :pts

      t.timestamps null: false
    end
  end
end
