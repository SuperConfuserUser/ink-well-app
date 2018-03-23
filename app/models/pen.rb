class Pen < ActiveRecord::Base
  belongs_to :user
  belongs_to :pen_brand
  belongs_to :pen_type
  has_one :ink

  include Slugifiable
end
