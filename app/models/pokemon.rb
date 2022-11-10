class Pokemon < ApplicationRecord
  has_many :stats, dependent: :destroy
  has_many :types, dependent: :destroy
  accepts_nested_attributes_for :types, :stats
end
