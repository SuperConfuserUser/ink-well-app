class InkBrand < ActiveRecord::Base
  has_many :inks

  validates_presence_of :name
end
