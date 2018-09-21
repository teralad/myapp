class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.decimal    :item_total,                         precision: 8, scale: 2, default: 0.0, null: false
      t.decimal    :total,                              precision: 8, scale: 2, default: 0.0, null: false
      t.string     :state
      t.decimal    :adjustment_total,                   precision: 8, scale: 2, default: 0.0, null: false
      t.references :user
      t.datetime   :completed_at
      t.decimal    :payment_total,                      precision: 8, scale: 2, default: 0.0
      t.timestamps null: false
    end
  end
end
