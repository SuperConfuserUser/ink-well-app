class InkBrand < ActiveRecord::Base
  has_many :inks

  include Slugifiable
end
