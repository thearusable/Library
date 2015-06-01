class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :name
      t.string :adress
      t.string :phone

      t.timestamps null: false
    end
  end
end 
