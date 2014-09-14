require_relative '../../../lib/credit_card/flag/amex'

describe CreditCard::Flag::Amex do
  describe '#valid?' do
    context 'when it is valid' do
      it { expect(CreditCard::Flag::Amex.new(378282246310005).valid?).to be }
      it { expect(CreditCard::Flag::Amex.new(348282246310005).valid?).to be }
    end
    context 'when it is invalid' do
      it { expect(CreditCard::Flag::Amex.new(34828224631).valid?).not_to be }
    end
  end
end
