class Ink < ActiveRecord::Base
  belongs_to :user
  belongs_to :pen
  belongs_to :ink_brand
  has_many :ink_color_families
  has_many :color_families, through: :ink_color_families

  validates_presence_of :name, presence: {message: "Can't add new ink without a name."}
end


# t.integer "ink_brand_id"
# t.string "name"
# t.string "swatch"
# t.text "note"
# t.boolean "favorite"
# t.integer "user_id"
# t.integer "pen_id"
