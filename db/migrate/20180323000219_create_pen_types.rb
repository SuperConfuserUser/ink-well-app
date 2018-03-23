class CreatePenTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :pen_types do |t|
      t.string :name
    end
  end
end
