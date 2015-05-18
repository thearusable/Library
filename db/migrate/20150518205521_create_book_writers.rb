class CreateBookWriters < ActiveRecord::Migration
  def change
    create_table :book_writers do |t|
      t.integer :book_id
      t.integer :writer_id

      t.timestamps null: false
    end
  end
end
