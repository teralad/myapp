class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :product
      t.string     :name
      t.references :rule
      t.timestamp  :expires_at
      t.timestamps null: false
    end
  end
end
