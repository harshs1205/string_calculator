class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter_patterns = /,|\n/
    if numbers.start_with?("//")
      header, rest = numbers.split("\n", 2)
      custom = header[2..-1]
      delimiter_patterns = Regexp.new(Regexp.escape(custom))
      numbers = rest 
    end

    parts = numbers.split(delimiter_patterns)
    numbers = parts.map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
      raise "Negative numbers are not allowed #{negatives.join(', ')}"
    end

    numbers.sum
  end
end
