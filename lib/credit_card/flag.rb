class CreditCard
  class Flag
    def initialize(number)
      @number = number
    end

    def name
      if @number.to_s[0..1] == '37'
        'AMEX'
      elsif @number.to_s[0..3] == '6011'
        'Discover'
      elsif @number.to_s[0..1] == '51'
        'MasterCard'
      elsif @number.to_s[0] == '4'
        'VISA'
      else
        'Unknown'
      end
    end
  end
end
