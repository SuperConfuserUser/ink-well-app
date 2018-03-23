class CreatePens < ActiveRecord::Migration[5.1]
  def change
    create_table :pens do |t|
      t.integer :type_id
      t.integer :brand_id
      t.string :model
      t.string :description
      t.text :note
      t.boolean :favorite
      t.integer :ink_id
      t.integer :user_id
    end
  end
end
