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
end
