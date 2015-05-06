class CreateLibrarians < ActiveRecord::Migration
  def change
    create_table :librarians do |t|
      t.string :name
      t.string :lastname
      t.boolean :admin, :default => false

      t.timestamps null: false
    end
  end
end
