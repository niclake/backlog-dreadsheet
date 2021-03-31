class RemoveServiceFromGames < ActiveRecord::Migration[6.0]
  def up
    remove_column :games, :service
  end

  def down
    add_column :games, :service, :string
  end
end
