class RenameHrEstToHourEstForGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :hr_est, :hour_estimate
  end
end
