class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id,      null: false, default: ""
      t.integer :order_id,    null: false, default: ""
      t.integer :price,       null: false, default: ""
      t.integer :amount,      null: false, default: ""
      t.integer :make_status, null: false, default: 0
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
