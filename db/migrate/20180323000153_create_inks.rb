class CreateInks < ActiveRecord::Migration[5.1]
  def change
    create_table :inks do |t|
      t.integer :ink_brand_id
      t.string :name
      t.string :swatch
      t.text :note
      t.boolean :favorite
      t.integer :user_id
      t.integer :pen_id
    end
  end
end
