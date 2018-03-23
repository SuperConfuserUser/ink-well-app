class CreateInkColorFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :ink_color_families do |t|
      t.integer :ink_id
      t.integer :color_family_id
    end
  end
end
