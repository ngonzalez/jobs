class CreateCarOptions < ActiveRecord::Migration[7.0]
  def change
    execute "CREATE TYPE car_options_types AS ENUM ('%s');" % car_options_types
    create_table :car_options do |t|
      t.integer :car_option_id, null: false
      t.integer :rental_id, null: false
      t.string :car_option_type, null: false
      t.timestamps
      t.index ['car_option_id'], name: 'index_car_options_on_car_option_id'
    end
  end
  
  private
  def car_options_types
    CAR_OPTIONS_TYPES.keys.join('\', \'')
  end
end
