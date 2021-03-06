require 'rspec'
require_relative '../lib/credit_card'

describe CreditCard do
  describe '#valid?' do
    context 'valid number' do
      it 'returns true' do
        credit_card_number = 4111111111111111

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.valid?).to be
      end

      it 'returns true' do
        credit_card_number = 4012888888881881

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.valid?).to be
      end

      it 'returns true' do
        credit_card_number = 5105105105105100

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.valid?).to be
      end
    end

    context 'invalid number' do
      it 'returns false' do
        credit_card_number = 4111111111111

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.valid?).not_to be
      end

      it 'returns false' do
        credit_card_number = 4105105105105100

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.valid?).not_to be
      end
    end
  end

  describe '#number' do
    context 'numbers without spaces' do
      it 'returns the number' do
        credit_card_number = 4111111111111111

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.number).to eq (credit_card_number)
      end
    end

    context 'numbers without spaces' do
      it 'returns the number' do
        credit_card_number = '5105 1051 0510 5106'

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.number).to eq 5105105105105106
      end
    end
  end

  describe '#flag' do
    context 'an existent flag' do
      it "returns the flag's name" do
        allow_any_instance_of(CreditCard::Flag).to receive(:name).and_return 'VISA'
        credit_card_number = 4111111111111111

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.flag_name).to eq 'VISA'
      end
    end

    context 'an inexistent flag' do
      it "returns the flag's name" do
        allow_any_instance_of(CreditCard::Flag).to receive(:name).and_return 'Unknown'
        credit_card_number = 9111111111111111

        credit_card = CreditCard.new(credit_card_number)

        expect(credit_card.flag_name).to eq 'Unknown'
      end
    end
  end
end
