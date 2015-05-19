class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :name
      t.string :lastname
      t.text :biography
      t.string :nationality

      t.timestamps null: false
    end
  end
end
