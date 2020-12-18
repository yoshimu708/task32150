class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.references :task, foreign_key: true, null: false
      t.timestamps
      t.index [:user_id, :task_id], unique: true 
    end
  end
end
