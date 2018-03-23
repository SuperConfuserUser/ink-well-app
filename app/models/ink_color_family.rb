class InkColorFamily < ActiveRecord::Base
  belongs_to :inks
  belongs_to :color_families
end
