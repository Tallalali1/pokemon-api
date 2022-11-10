# frozen_string_literal: true

# Stores types for Pokemon table
class Type < ApplicationRecord
  belongs_to :pokemon
  self.inheritance_column = :_type_disabled
  validates :slot, numericality: { only_integer: true }
  validate :format_of_type_hash

  def format_of_type_hash
    unless type.is_a?(Hash)
      errors.add(:type, "is not a hash")
      return
    end
  end
end
