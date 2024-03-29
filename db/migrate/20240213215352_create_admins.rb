class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table "admins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.string :auth_token

      t.timestamps
    end
  end
end
