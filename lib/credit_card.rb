require_relative './credit_card/flag'

class CreditCard
  def initialize(number)
    @number = number
  end

  def flag_name
    CreditCard::Flag.new(number).name
  end

  def number
    @number.to_s.gsub(/\s/, '').to_i
  end

  def valid?
    digits = @number.to_s.reverse.split('').map.with_index do |digit, position|
      real_position = position + 1
      digit = digit.to_i
      if real_position.even?
        digit = double_digit(digit)
        sum_greater_than_10_digit(digit)
      else
        digit
      end
    end

    digits.inject(:+) % 10 == 0
  end

  private

  def sum_greater_than_10_digit(digit)
    if digit.to_s.length > 1
      digit.to_s.split('').map(&:to_i).inject(:+).to_i
    else
      digit
    end
  end

  def double_digit(digit)
    digit * 2
  end
end
