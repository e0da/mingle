class Position < ActiveRecord::Base
  attr_accessible :description
  has_many :people
end
