class ChangeObjectIdToString < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :object_id, :string
  end
end
