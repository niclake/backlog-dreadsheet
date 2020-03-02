class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.string :system, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
