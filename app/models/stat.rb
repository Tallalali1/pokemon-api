# frozen_string_literal: true

# Stores stats for Pokemon table
class Stat < ApplicationRecord
  belongs_to :pokemon
  validates :base_stat, numericality: { only_integer: true }
  validates :effort, numericality: { only_integer: true }
  validate :format_of_stat_hash

  def format_of_stat_hash
    return if stat.is_a?(Hash)

    errors.add(:stat, 'is not a hash')
    nil
  end
end
