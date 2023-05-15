class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.string :chain
      t.references :deal_stage, null: false, foreign_key: true
      t.string :state
      t.string :tte_servicing_pharmacy
      t.string :total_residential_individuals
      t.string :probability_of_close
      t.date :go_live_date
      t.string :incumbent_pharmacy
      t.string :delivery_type
      t.string :comments
      t.string :pipeline_date
      t.integer :forecasted_individuals
      t.string :objectid

      t.timestamps
    end
  end
end
