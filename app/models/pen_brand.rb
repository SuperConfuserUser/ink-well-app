class PenBrand < ActiveRecord::Base
  has_many :pens

  include Slugifiable
end
