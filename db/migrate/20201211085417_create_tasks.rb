class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string  :task_name,   null: false
      t.string  :status,      null: false
      t.string  :limit ,      null: false
      t.text    :details
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
