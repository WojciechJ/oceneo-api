class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :value
      t.text :comment
      t.references :user_id, foreign_key: true
      t.references :product_id, foreign_key: true

      t.timestamps
    end
  end
end
