class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :licence
      t.string :animal_type

      t.timestamps
    end

    add_index :animals, :licence, unique: true
  end
end
