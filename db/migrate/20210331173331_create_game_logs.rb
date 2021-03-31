class CreateGameLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :game_logs do |t|
      t.belongs_to :game, foreign_key: true
      t.date :date
      t.decimal :hours
    end
  end
end
