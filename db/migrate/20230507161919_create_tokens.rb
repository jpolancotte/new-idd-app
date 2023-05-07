class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :refresh_token
      t.string :access_token
      t.datetime :expires_in
      t.datetime :expires_at

      t.timestamps
    end
  end
end
