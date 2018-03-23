class CreatePens < ActiveRecord::Migration[5.1]
  def change
    create_table :pens do |t|
      t.integer :pen_type_id
      t.integer :pen_brand_id
      t.string :model
      t.string :description
      t.text :note
      t.boolean :favorite
      t.integer :ink_id
      t.integer :user_id
    end

    add_index :pens, :pen_type_id
    add_foreign_key :pens, :pen_types
    add_index :pens, :pen_brand_id
    add_foreign_key :pens, :pen_brands
    add_index :pens, :ink_id
    add_foreign_key :pens, :inks
    add_index :pens, :user_id
    add_foreign_key :pens, :users
  end
end
