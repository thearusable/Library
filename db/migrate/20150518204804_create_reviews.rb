class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.string :comment
      t.integer :book_id
      t.integer :reader_id

      t.timestamps null: false
    end
  end
end
