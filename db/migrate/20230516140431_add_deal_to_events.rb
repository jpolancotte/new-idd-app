class AddDealToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :deal, null: false, foreign_key: true
  end
end
