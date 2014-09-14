require_relative './flag/visa'
require_relative './flag/amex'
require_relative './flag/discover'
require_relative './flag/master_card'

class CreditCard
  class Flag
    def initialize(number)
      @number = number
    end

    def name
      if Amex.new(@number).valid?
        'AMEX'
      elsif Discover.new(@number).valid?
        'Discover'
      elsif MasterCard.new(@number).valid?
        'MasterCard'
      elsif Visa.new(@number).valid?
        'VISA'
      else
        'Unknown'
      end
    end
  end
end
