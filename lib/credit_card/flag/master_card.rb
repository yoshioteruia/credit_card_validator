class CreditCard
  class Flag
    class MasterCard
      attr_reader :number

      def initialize(number)
        @number = number 
      end

      def valid?
        number_has_16_numbers? and number_is_between_51_and_55?
      end

      private

      def number_has_16_numbers?
        number.to_s.length == 16
      end

      def number_is_between_51_and_55?
        ('51'..'55').include? number.to_s[0..1]
      end
    end
  end
end
