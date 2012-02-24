class User < ActiveRecord::Base
  has_and_belongs_to_many :courses
  attr_accessible :uni
end
