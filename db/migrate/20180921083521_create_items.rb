class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :product
      t.references :order
      t.references :category
      t.integer    :quantity, null: false
      t.decimal    :price,    precision: 8, scale: 2, null: false
      t.timestamps null: false
    end
  end
end
