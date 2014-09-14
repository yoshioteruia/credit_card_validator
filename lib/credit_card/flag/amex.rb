class CreditCard
  class Flag
    class Amex
      attr_reader :number

      def initialize(number)
        @number = number
      end

      def valid?
        has_15_numbers? and number_begins_with_37_or_34?
      end

      private

      def has_15_numbers?
        number.to_s.length == 15
      end

      def number_begins_with_37_or_34?
        number.to_s[0..1] == '37' or number.to_s[0..1] == '34'
      end
    end
  end
end
