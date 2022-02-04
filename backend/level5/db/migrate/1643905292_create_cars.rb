class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.integer :car_id, null: false
      t.integer :price_per_day, null: false
      t.integer :price_per_km, null: false
      t.timestamps
      t.index ['car_id'], name: 'index_cars_on_car_id'
    end
  end
end
