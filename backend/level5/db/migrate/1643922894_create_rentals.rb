class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.integer :car_id, null: false
      t.integer :rental_id, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :distance, null: false
      t.timestamps
      t.index ['car_id'], name: 'index_rentals_on_car_id'
    end
  end
end
