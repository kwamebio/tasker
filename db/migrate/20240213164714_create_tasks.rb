class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :title
      t.string :body
      t.string :description
      t.string :assigned_to
      t.string :estimated_time
      t.integer :status, default: 0
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :project, null: false, foreign_key: true, type: :uuid


      t.timestamps
    end
  end
end
