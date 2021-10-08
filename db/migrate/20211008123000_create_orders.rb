class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :ordered_postal_code
      t.string :ordered_address
      t.string :ordered_name
      t.integer :shipping_fee
      t.integer :amount_billed
      t.integer :payment_method
      t.integer :ordered_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
