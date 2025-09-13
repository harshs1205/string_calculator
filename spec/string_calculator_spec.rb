require_relative 'spec_helper'
require_relative '../lib/string_calculator'

Rspec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end
  end
end