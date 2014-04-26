class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string  :stripe_customer_id
      t.string  :stripe_charge_id
      t.decimal :amount, precision: 11, scale: 2
      t.string  :currency
      t.integer :animal_id

      t.timestamps
    end
  end
end
