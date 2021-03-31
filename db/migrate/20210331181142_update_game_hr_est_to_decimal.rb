class UpdateGameHrEstToDecimal < ActiveRecord::Migration[6.0]
  def up
    change_column :games, :hr_est, :decimal
  end

  def down
    change_column :games, :hr_est, :integer
  end
end
