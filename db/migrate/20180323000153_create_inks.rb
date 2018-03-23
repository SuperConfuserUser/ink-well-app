class CreateInks < ActiveRecord::Migration[5.1]
  def change
    create_table :inks do |t|
      t.integer :ink_brand_id
      t.string :name
      t.string :swatch
      t.text :note
      t.boolean :favorite
      t.integer :user_id
    end

    add_index :inks, :ink_brand_id
    add_foreign_key :inks, :ink_brands
    add_index :inks, :user_id
    add_foreign_key :inks, :users
  end
end
