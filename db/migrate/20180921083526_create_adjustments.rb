class CreateAdjustments < ActiveRecord::Migration[5.1]
  def change
    create_table :adjustments do |t|
      t.references :adjustable, polymorphic: true
      t.decimal    :amount,     precision: 8, scale: 2
      t.boolean    :eligible,   default: true
      t.timestamps null: false
    end
  end
end
