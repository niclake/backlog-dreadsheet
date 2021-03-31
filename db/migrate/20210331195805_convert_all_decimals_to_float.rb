class ConvertAllDecimalsToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :hour_estimate, :float
    change_column :games, :order, :float
    change_column :game_logs, :hours, :float
  end
end
