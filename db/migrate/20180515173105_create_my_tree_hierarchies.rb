class CreateMyTreeHierarchies < ActiveRecord::Migration[5.2]
  def change
    create_table :my_tree_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :my_tree_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "my_tree_anc_desc_idx"

    add_index :my_tree_hierarchies, [:descendant_id],
      name: "my_tree_desc_idx"
  end
end
