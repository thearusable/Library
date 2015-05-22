class AddColumnsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :description, :text
    add_column :books, :averageRating, :integer
    add_column :books, :releaseDate, :date
    add_column :books, :publishingHouse, :string
    add_column :books, :ISBN, :string
    add_column :books, :category_id, :integer
    add_column :books, :reservation_id, :integer
  end
end
