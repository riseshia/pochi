class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 128, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
