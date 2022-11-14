# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  has_many :stats
  has_many :types
  attributes :id, :name, :base_experience, :weight
end
