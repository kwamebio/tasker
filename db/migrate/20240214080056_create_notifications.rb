class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.boolean :read
      t.text :content

      t.timestamps
    end
  end
end
