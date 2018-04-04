class InkBrand < ActiveRecord::Base
  has_many :inks

  validates :name, presence: true
  validates :name, uniqueness: true
end
