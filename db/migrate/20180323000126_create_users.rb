class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :tagline
      t.text :about
      t.string :avatar_link
    end
  end
end
