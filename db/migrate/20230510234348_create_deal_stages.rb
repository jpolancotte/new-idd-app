class CreateDealStages < ActiveRecord::Migration[7.0]
  def change
    create_table :deal_stages do |t|
      t.string :name

      t.timestamps
    end
  end
end
