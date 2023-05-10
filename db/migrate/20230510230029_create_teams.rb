class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :first
      t.string :last
      t.string :email
      t.string :hs_user_number

      t.timestamps
    end
  end
end
