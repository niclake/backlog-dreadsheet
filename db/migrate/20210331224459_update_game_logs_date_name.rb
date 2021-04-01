class UpdateGameLogsDateName < ActiveRecord::Migration[6.0]
  def change
    rename_column :game_logs, :date, :completion_date
  end
end
