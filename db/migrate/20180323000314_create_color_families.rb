class CreateColorFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :color_families do |t|
      t.string :name
    end
  end
end
