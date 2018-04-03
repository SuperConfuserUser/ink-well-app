class Pen < ActiveRecord::Base
  belongs_to :user
  belongs_to :pen_brand
  belongs_to :pen_type
  has_one :ink

  validates :pen_type, presence: {message: "Type can't be blank."}
  validates :pen_brand, presence: {message: "Brand can't be blank."}
  validates :model, presence: {message: "Model can't be blank."}
end
