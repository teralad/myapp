class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.references :user,       polymorphic: true
      t.decimal    :amount,     precision: 8, scale: 2
      t.boolean    :eligible,   default: true
      t.timestamps
    end
  end
end
