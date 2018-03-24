class Pen < ActiveRecord::Base
  belongs_to :user
  belongs_to :pen_brand
  belongs_to :pen_type
  has_one :ink

  # validates_presence_of :pen_type, :pen_brand, :model
end
