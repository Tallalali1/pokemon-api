# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:stats).dependent(:destroy) }
    it { is_expected.to have_many(:types).dependent(:destroy) }
  end

  describe 'Validations' do
    let(:pokemon) { build :pokemon }

    it { expect(pokemon).to be_valid }

    it 'validates name' do
      pokemon.name = nil

      expect(pokemon.valid?).to be(false)
    end

    it 'validates weight to be integer' do
      pokemon.weight = "'10'"

      expect(pokemon.valid?).to be(false)
    end

    it 'validates base_experience to be integer' do
      pokemon.base_experience = "'10'"

      expect(pokemon.valid?).to be(false)
    end
  end
end
