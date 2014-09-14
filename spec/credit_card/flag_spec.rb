require 'rspec'
require_relative '../../lib/credit_card/flag'

describe CreditCard::Flag do
  describe '#name' do
    context 'valid VISA' do
      it 'returns VISA' do
        allow_any_instance_of(CreditCard::Flag::Visa).to receive(:valid?) { true }
        credit_card_number = 4111111111111111

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'VISA'
      end
    end

    context 'invalid VISA' do
      it 'returns Unknown' do
        allow_any_instance_of(CreditCard::Flag::Visa).to receive(:valid?) { false }
        credit_card_number = 41111111111

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Unknown'
      end
    end

    context 'valid AMEX' do
      it 'returns AMEX' do
        allow_any_instance_of(CreditCard::Flag::Amex).to receive(:valid?) { true }
        credit_card_number = 378282246310005

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'AMEX'
      end
    end

    context 'invalid AMEX' do
      it 'returns AMEX' do
        allow_any_instance_of(CreditCard::Flag::Amex).to receive(:valid?) { false }
        credit_card_number = 3782822463

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Unknown'
      end
    end

    context 'valid Discover' do
      it 'returns Discover' do
        allow_any_instance_of(CreditCard::Flag::Discover).to receive(:valid?) { true }
        credit_card_number = 6011111111111117 

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Discover'
      end
    end

    context 'invalid Discover' do
      it 'returns Discover' do
        allow_any_instance_of(CreditCard::Flag::Discover).to receive(:valid?) { false }
        credit_card_number = 601311111111111117 

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Unknown'
      end
    end

    context 'valid MasterCard' do
      it 'returns MasterCard' do
        allow_any_instance_of(CreditCard::Flag::MasterCard).to receive(:valid?) { true }
        credit_card_number = 5105105105105100

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'MasterCard'
      end
    end

    context 'invalid MasterCard' do
      it 'returns MasterCard' do
        allow_any_instance_of(CreditCard::Flag::MasterCard).to receive(:valid?) { false }
        credit_card_number = 5005105105105100

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Unknown'
      end
    end

    context 'invalid flag' do
      it 'returns Unknown' do
        credit_card_number = 9111111111111111

        credit_card_flag = CreditCard::Flag.new(credit_card_number) 

        expect(credit_card_flag.name).to eq 'Unknown'
      end
    end
  end
end
