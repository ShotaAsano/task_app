class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :status
      t.datetime :deadline_at

      t.timestamp
    end
  end
end
