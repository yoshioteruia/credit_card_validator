require 'rspec'
require_relative '../../../lib/credit_card/flag/discover'

describe CreditCard::Flag::Discover do
  describe '#valid?' do
    context 'when it is valid' do
      it { expect(CreditCard::Flag::Discover.new(6011111111111117).valid?).to be }
    end
    context 'when it is invalid' do
      it { expect(CreditCard::Flag::Discover.new(601111111111).valid?).not_to be }
      it { expect(CreditCard::Flag::Discover.new(6013111111111117).valid?).not_to be }
    end
  end
end
