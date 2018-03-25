class PenBrand < ActiveRecord::Base
  has_many :pens

  validates_presence_of :name, presence: {message: "Can't add a new brand without a name."}
  validates_uniqueness_of :name, presence: {message: "Can't add a brand that already exists."}
end
