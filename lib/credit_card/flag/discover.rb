class CreditCard
  class Flag
    class Discover
      attr_reader :number

      def initialize(number)
        @number = number
      end

      def valid?
        number_starts_with_6011? and number_has_16_numbers?
      end

      private

      def number_starts_with_6011?
        number.to_s[0..3] == '6011'
      end

      def number_has_16_numbers?
        number.to_s.length == 16
      end
    end
  end
end
