# frozen_string_literal: true

# Stores stats for Pokemon table
class Stat < ApplicationRecord
  belongs_to :pokemon
end
