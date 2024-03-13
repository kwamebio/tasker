class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.string :images
      t.string :videos
      t.integer :role, default: 0


      t.timestamps
    end
  end
end
