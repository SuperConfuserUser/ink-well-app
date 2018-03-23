class User < ActiveRecord::Base
  has_secure_password

  has_many :pens
  has_many :pen_brands, through: :pens
  has_many :pen_types, through: :pens
  has_many :inks
  has_many :ink_brands, through: :inks
  has_many :color_families, through: :inks

  validates_presence_of :username, :email
  validates_uniqueness_of :username, presence: {message: "That username is taken :("}
  validates_uniqueness_of :email, presence: {message: "There is already an account with that email. Try logging in."}

  include Slugifiable
end
