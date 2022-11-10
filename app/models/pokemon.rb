# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :stats, dependent: :destroy
  has_many :types, dependent: :destroy
  accepts_nested_attributes_for :types, :stats
  validates :name, presence: true
  validates :base_experience, numericality: { only_integer: true }
  validates :weight, numericality: { only_integer: true }
end
