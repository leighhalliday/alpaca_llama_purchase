class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :subtotal_cents, null: false
      t.integer :tax_cents, null: false
      t.integer :shipping_cents, null: false
      t.integer :total_cents, null: false
      t.float :tax_rate, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :shipment_id
      t.string :status, null: false, default: 'initial'

      t.timestamps
    end
  end
end
