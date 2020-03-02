class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :series
      t.integer :sort
      t.string :system
      t.string :status
      t.text :notes
      t.integer :hr_est
      t.integer :hr_comp
      t.date :date_comp

      t.timestamps
    end
  end
end
