require_relative '20191218142623_create_games'

class UpdateGames < ActiveRecord::Migration[6.0]
  def change
    revert CreateGames

    create_table :games do |t|
      t.belongs_to :system, foreign_key: true
      t.belongs_to :status, foreign_key: true
      t.string :title, null: false
      t.string :series
      t.string :sort
      t.string :service
      t.boolean :owned
      t.integer :hr_est
      t.integer :hr_comp
      t.date :date_comp

      t.timestamps
    end
  end
end
