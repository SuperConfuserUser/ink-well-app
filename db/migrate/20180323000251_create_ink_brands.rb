class CreateInkBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :ink_brands do |t|
      t.string :name
    end
  end
end
