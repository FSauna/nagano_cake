class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :name,         null: false, default: ""
      t.string :postal_code,  null: false, default: ""
      t.string :address,      null: false, default: ""
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
