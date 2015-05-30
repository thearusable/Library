class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :averageRating
      t.date :releaseDate
      t.string :publishingHouse
      t.string :ISBN
      t.integer :category_id
      t.integer :current_reservation_id

      t.timestamps null: false
    end
  end
end
