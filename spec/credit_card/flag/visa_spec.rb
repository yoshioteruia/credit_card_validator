require_relative '../../../lib/credit_card/flag/visa'

describe CreditCard::Flag::Visa do
  describe '#valid?' do
    context 'when it is valid' do
      it { expect(CreditCard::Flag::Visa.new(4111111111111111).valid?).to be }
      it { expect(CreditCard::Flag::Visa.new(4111111111111).valid?).to be }
    end
    context 'when it is invalid' do
      it { expect(CreditCard::Flag::Visa.new(41111111111).valid?).not_to be }
    end
  end
end
