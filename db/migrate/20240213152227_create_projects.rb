class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
