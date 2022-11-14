# frozen_string_literal: true

class StatSerializer < ActiveModel::Serializer
  attributes :id, :base_stat, :effort, :stat
end
