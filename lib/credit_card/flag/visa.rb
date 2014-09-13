class CreditCard
  class Flag
    class Visa
      attr_reader :number

      def initialize(number)
        @number = number
      end

      def valid?
        number.to_s[0] == '4' and (@number.to_s.length == 13 or @number.to_s.length == 16)
      end
    end
  end
end
