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
    numbers = @number.to_s.reverse.split('').map.with_index do |n, i|
      i += 1
      n = n.to_i
      if i.even?
        sum = n + n
        if sum.to_s.length > 1
          sum.to_s.split('').map(&:to_i).inject(:+).to_i
        else
          sum
        end
      else
        n
      end
    end
    numbers.inject(:+) % 10 == 0
  end
end
