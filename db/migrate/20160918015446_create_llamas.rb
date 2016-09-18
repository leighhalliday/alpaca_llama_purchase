class CreateLlamas < ActiveRecord::Migration[5.0]
  def change
    create_table :llamas do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.float :weight_kg, null: false
      t.integer :price_cents, null: false
      t.text :description, null: false
      t.string :photo_url, null: false
      t.integer :order_id

      t.timestamps
    end
  end
end
