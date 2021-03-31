class AddNicknameToSystems < ActiveRecord::Migration[6.0]
  def change
    change_table :systems do |t|
      t.string :nickname
    end
  end
end
