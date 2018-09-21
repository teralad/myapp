class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :discountable, polymorphic: true
      t.string     :name
      t.timestamp  :expires_at
      t.timestamps null: false
    end
  end
end
