class CreateLastSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :last_searches do |t|
      t.references :state, null: false, foreign_key: true
      t.references :taxonomy_description, null: false, foreign_key: true
      t.string :skip

      t.timestamps
    end
  end
end
