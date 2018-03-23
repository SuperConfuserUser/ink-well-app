class ColorFamily < ActiveRecord::Base
  has_many :ink_color_families
  has_many :inks, through: :ink_color_families
end
