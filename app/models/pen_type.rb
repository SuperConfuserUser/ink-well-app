class PenType < ActiveRecord::Base
  has_many :pens

  validates_presence_of :name, presence: {message: "Can't add a new type without a name."}
  validates_uniqueness_of :name, presence: {message: "Can't add a type that already exists."}
end
