# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:pokemon) }
  end
end
