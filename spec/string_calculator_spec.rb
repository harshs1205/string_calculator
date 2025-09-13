require_relative 'spec_helper'
require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number for a single number string' do 
      expect(StringCalculator.add('5')).to eq(5)
    end

    it 'return the sum of two numbers for two comma separated numbers' do 
      expect(StringCalculator.add('1,2')).to eq(3)
    end

    it 'returns the sum of multiple comma separated numbers' do
      expect(StringCalculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'allows newlines as delimiters' do 
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom single character delimiters' do
      expect(StringCalculator.add("//;\n1l;2")).to eq(3)
    end

    it 'raises with all negative numbers listed' do 
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("Negative numbers are not allowed -2, -4")
    end
  end
end