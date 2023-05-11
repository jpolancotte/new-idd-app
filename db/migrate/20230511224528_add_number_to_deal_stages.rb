class AddNumberToDealStages < ActiveRecord::Migration[7.0]
  def change
    add_column :deal_stages, :number, :string
  end
end
