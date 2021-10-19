class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id,     null: false, default: ""
      t.integer :customer_id, null: false, default: ""
      t.integer :amount,      null: false, default: ""
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
