class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string  :name
      t.string  :description
      t.string  :action
      t.integer :action_on
      t.timestamps
    end
  end
end
