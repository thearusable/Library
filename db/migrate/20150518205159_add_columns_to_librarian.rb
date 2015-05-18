class AddColumnsToLibrarian < ActiveRecord::Migration
  def change
    add_column :librarians, :adress, :string
    add_column :librarians, :phone, :string
  end
end
