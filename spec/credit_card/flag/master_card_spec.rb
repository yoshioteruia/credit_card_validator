require 'rspec'
require_relative '../../../lib/credit_card/flag/master_card.rb'

describe CreditCard::Flag::MasterCard do
  describe '#valid?' do
    context 'when it is valid' do
      it { expect(CreditCard::Flag::MasterCard.new(5105105105105100).valid?).to be }
      it { expect(CreditCard::Flag::MasterCard.new(5205105105105100).valid?).to be }
      it { expect(CreditCard::Flag::MasterCard.new(5305105105105100).valid?).to be }
      it { expect(CreditCard::Flag::MasterCard.new(5405105105105100).valid?).to be }
      it { expect(CreditCard::Flag::MasterCard.new(5505105105105100).valid?).to be }
    end

    context 'when it is invalid' do
      it { expect(CreditCard::Flag::MasterCard.new(55051051051051000).valid?).not_to be }
      it { expect(CreditCard::Flag::MasterCard.new(5005105105105100).valid?).not_to be }
    end
  end
end
