class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author_first, null: false
      t.string :author_last, null: false
      t.string :genre
      t.string :series
      t.integer :sort
      t.boolean :book_owned
      t.boolean :book_read
      t.boolean :book_read_date
      t.text :notes

      t.timestamps
    end
  end
end
