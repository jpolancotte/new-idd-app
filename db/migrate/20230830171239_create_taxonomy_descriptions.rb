class CreateTaxonomyDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :taxonomy_descriptions do |t|
      t.string :name

      t.timestamps
    end
  end
end
