class User < ActiveRecord::Base
  has_many :pens
  has_many :pen_brands, through: :pens
  has_many :pen_types, through: :pens
  has_many :inks
  has_many :ink_brands, through: :inks
  has_many :color_families, through: :inks

  has_secure_password
end
