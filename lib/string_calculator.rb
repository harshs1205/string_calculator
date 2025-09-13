class StringCalculator
  def self.add(input)
    return 0 if input.nil? || input.empty?

    delimiter = parse_delimiter(input)
    numbers = tokenize(input, delimiter)

    check_negatives!(numbers)
    numbers.sum
  end

  def self.parse_delimiter(input)
    if input.start_with?("//")
      header, = input.split("\n", 2)
      Regexp.new(Regexp.escape(header[2..-1]))
    else
      /,|\n/
    end
  end

  def self.tokenize(input, delimiter)
    if input.start_with?("//")
      _, rest = input.split("\n", 2)
      rest.split(delimiter).map(&:to_i)
    else
      input.split(delimiter).map(&:to_i)
    end
  end

    def self.check_negatives!(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise "Negative numbers are not allowed #{negatives.join(', ')}" if negatives.any?
  end
end
