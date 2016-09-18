class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :status, null: false, default: 'initial'
      t.integer :order_id, null: false
      t.string :postal_code, null: false
      t.float :weight_kg, null: false
      t.string :shipper, null: false
      t.string :service_level, null: false
      t.string :tracking_code

      t.timestamps
    end
  end
end
