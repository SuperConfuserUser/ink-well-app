class User < ActiveRecord::Base
  has_secure_password

  has_many :pens
  has_many :pen_brands, through: :pens
  has_many :pen_types, through: :pens
  has_many :inks
  has_many :ink_brands, through: :inks
  has_many :color_families, through: :inks

  validates :username, uniqueness: {case_sensitive: false, message: "That username is taken."}, presence: {message: "Username can't be blank."}
  validates :email, uniqueness: {case_sensitive: false, message: "There is already an account with that email. Try logging in."}, presence: {message: "Email can't be blank."}

  include Slugifiable
end
