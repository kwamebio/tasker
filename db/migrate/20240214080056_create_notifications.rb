class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table "notifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.boolean :read
      t.text :content

      t.timestamps
    end
  end
end
