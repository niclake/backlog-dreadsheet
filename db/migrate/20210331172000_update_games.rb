class UpdateGames < ActiveRecord::Migration[6.0]
  def change
    change_table :games do |t|
      t.remove_belongs_to :status
      t.remove :sort
      t.remove :hr_comp
      t.remove :date_comp
      t.integer :status
      t.decimal :order
    end
  end
end
