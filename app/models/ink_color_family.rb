class InkColorFamily < ActiveRecord::Base
  belongs_to :ink
  belongs_to :color_family

  include Slugifiable
end
