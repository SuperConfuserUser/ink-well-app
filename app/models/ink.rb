class Ink < ActiveRecord::Base
  belongs_to :user
  belongs_to :pen
  belongs_to :ink_brand
  has_many :ink_color_families
  has_many :color_families, through: :ink_color_families

  validates :name, presence: {message: "Name can't be blank."}
  validates :ink_brand, presence: {message: "Brand can't be blank."}
end
