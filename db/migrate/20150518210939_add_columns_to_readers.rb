class AddColumnsToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :adress, :string
    add_column :readers, :phone, :string
  end
end
