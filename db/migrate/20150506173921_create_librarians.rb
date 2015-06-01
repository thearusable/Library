class CreateLibrarians < ActiveRecord::Migration
  def change
    create_table :librarians do |t|
      t.string :name
      t.boolean :admin, :default => false
      t.string :adress
      t.string :phone

      t.timestamps null: false
    end
  end
end
