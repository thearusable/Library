class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.boolean :received
      t.boolean :returned
      t.date :receivedDate
      t.date :returnedDate
      t.integer :reader_id

      t.timestamps null: false
    end
  end
end
