class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :deadline
      t.integer :status, default: 0
      t.string :priority
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
