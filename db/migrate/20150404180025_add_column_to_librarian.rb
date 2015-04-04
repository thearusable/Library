class AddColumnToLibrarian < ActiveRecord::Migration
  def change
    add_column :librarians, :isAdmin, :boolean
  end
end
