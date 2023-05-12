class AddHsDealOwnerNumberToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :hs_deal_owner_number, :string
  end
end
