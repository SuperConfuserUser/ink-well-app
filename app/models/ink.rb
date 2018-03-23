class Ink < ActiveRecord::Base
  belongs_to :user
  belongs_to :ink_brand
  has_many :color_families, through: :ink_color_families
end
