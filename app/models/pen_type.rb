class PenType < ActiveRecord::Base
  has_many :pens

  include Slugifiable
end
