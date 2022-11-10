# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:stats).dependent(:destroy) }
    it { is_expected.to have_many(:types).dependent(:destroy) }
  end
end
