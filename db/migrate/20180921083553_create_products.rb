class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string     :name,                 default: '', null: false
      t.references :category
      t.text       :description
      t.datetime   :available_on
      t.datetime   :deleted_at
      t.integer    :count_on_hand,        default: 0,  null: false
      t.timestamps null: false
    end
  end
end
