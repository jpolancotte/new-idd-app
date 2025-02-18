class AddTeamToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :team, null: true, foreign_key: true
  end
end
