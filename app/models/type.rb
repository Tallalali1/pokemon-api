# frozen_string_literal: true

# Stores types for Pokemon table
class Type < ApplicationRecord
  # disabling type column being used for single table inheritance
  self.inheritance_column = :_type_disabled

  # Relationships
  belongs_to :pokemon

  # Validations
  validates :slot, numericality: { only_integer: true }
  validate :format_of_type_hash

  private

  def format_of_type_hash
    return if type.is_a?(Hash)

    errors.add(:type, 'is not a hash')
    nil
  end
end
