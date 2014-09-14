require_relative './credit_card'

class CreditCardsValidator
  def initialize(numbers)
    @numbers = numbers.strip
  end

  def to_s
    @numbers.split("\n").map do |number|
      credit_card = CreditCard.new(number)
      validation = credit_card.valid? ? "valid" : "invalid"
      "%-29s" % "#{credit_card.flag_name}: #{credit_card.number}" + "(#{validation})"
    end * "\n"
  end
end
