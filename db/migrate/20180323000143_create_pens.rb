class CreatePens < ActiveRecord::Migration[5.1]
  def change
    create_table :pens do |t|
      t.integer :pen_type_id
      t.integer :pen_brand_id
      t.string :model
      t.string :description
      t.text :note
      t.boolean :favorite
      t.integer :user_id
    end
  end
end
