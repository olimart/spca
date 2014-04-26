class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string  :name
      t.string  :licence
      t.decimal :licence_amount, precision: 11, scale: 2
      t.string  :animal_type
      t.string  :owner

      t.timestamps
    end

    add_index :animals, :licence, unique: true
  end
end
