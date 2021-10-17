class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :name,         null: false, default: ""
      t.string :postal_code,  null: false, default: ""
      t.string :address,      null: false, default: ""
      t.datetime :created_at, null: false, default: now
      t.datetime :updated_at, null: false, default: now

      t.timestamps
    end
  end
end
