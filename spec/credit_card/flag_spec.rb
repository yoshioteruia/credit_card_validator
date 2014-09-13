require 'rspec'
require_relative '../../lib/credit_card/flag'

describe CreditCard::Flag do
  describe '#name' do
    context 'existent name' do
      it 'returns VISA' do
        credit_card_number = 4111111111111111

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'VISA'
      end

      it 'returns AMEX' do
        credit_card_number = 378282246310005

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'AMEX'
      end

      it 'returns Discover' do
        credit_card_number = 6011111111111117 

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Discover'
      end

      it 'returns MasterCard' do
        credit_card_number = 5105105105105100

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'MasterCard'
      end

      it 'returns Unknown' do
        credit_card_number = 9111111111111111

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Unknown'
      end
    end
  end
end
