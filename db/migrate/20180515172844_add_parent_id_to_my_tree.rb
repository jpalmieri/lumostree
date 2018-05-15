class AddParentIdToMyTree < ActiveRecord::Migration[5.2]
  def change
    add_column :my_trees, :parent_id, :integer
  end
end
