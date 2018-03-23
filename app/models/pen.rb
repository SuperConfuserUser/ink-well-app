class Pen < ActiveRecord::Base
  belongs_to :user
  belongs_to :pen_brand
  belongs_to :pen_type
  has_one :ink  #doesn't feel right... should ink belong to pen and add an pen_id to inks??
end
