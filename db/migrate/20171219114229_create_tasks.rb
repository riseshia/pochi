class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 256, null: false
      t.references :user, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end

    add_index 'tasks', %w[user_id category_id], name: 'task_user_id_category_id', using: :btree
  end
end
