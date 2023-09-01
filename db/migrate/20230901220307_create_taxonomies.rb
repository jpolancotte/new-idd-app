class CreateTaxonomies < ActiveRecord::Migration[7.0]
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.string :code
      t.string :group

      t.timestamps
    end
  end
end
