require_relative './flag/visa'
require_relative './flag/amex'
require_relative './flag/discover'

class CreditCard
  class Flag
    def initialize(number)
      @number = number
    end

    def name
      if Amex.new(@number).valid?
        'AMEX'
      elsif @number.to_s[0..3] == '6011'
        'Discover'
      elsif @number.to_s[0..1] == '51'
        'MasterCard'
      elsif Visa.new(@number).valid?
        'VISA'
      else
        'Unknown'
      end
    end
  end
end
