class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.references :promotable, polymorphic: true
      t.string     :name
      t.timestamp  :expires_at
      t.references :rule
      t.timestamps
    end
  end
end
