class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.references :task, foreign_key: true, null: false
      t.integer :unit, null: false

      t.timestamps
    end
  end
end
