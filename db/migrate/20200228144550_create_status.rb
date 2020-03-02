class CreateStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :key
      t.string :name
    end
  end
end
