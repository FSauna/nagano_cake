class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id,         null: false, default: ""
      t.string :postal_code,  null: false, default: ""
      t.string :address,      null: false, default: ""
      t.string :name,         null: false, default: ""
      t.integer :shipping_fee,        null: false, default: ""
      t.integer :amount_billed,       null: false, default: ""
      t.integer :payment_method,      null: false, default: ""
      t.integer :ordered_status,      null: false, default: 0
      t.datetime :created_at,         null: false
      t.datetime :updated_at,         null: false

      t.timestamps
    end
  end
end
