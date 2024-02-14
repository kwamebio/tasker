class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :body
      t.string :description
      t.integer :status, default: 0
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
