class Pokemon < ApplicationRecord
  has_many :stats
  has_many :types
end
