class CreateInkColorFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :ink_color_families do |t|
      t.integer :ink_id
      t.integer :color_family_id
    end

    add_index :ink_color_families, :ink_id
    add_foreign_key :ink_color_families, :inks
    add_index :ink_color_families, :color_family_id
    add_foreign_key :ink_color_families, :color_families
  end
end
