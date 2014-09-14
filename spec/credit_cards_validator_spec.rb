require 'rspec'
require_relative '../lib/credit_cards_validator'

describe CreditCardsValidator do
  it 'prints a list of credit cards' do
    credit_card_numbers = <<-EOL
      4111111111111111
      4111111111111
      4012888888881881
      378282246310005
      6011111111111117
      5105105105105100
      5105 1051 0510 5106
      9111111111111111
    EOL

    credit_cards = CreditCardsValidator.new(credit_card_numbers)

    formatted_credit_cards = (<<-EOL).strip
      VISA: 4111111111111111       (valid)
      VISA: 4111111111111          (invalid)
      VISA: 4012888888881881       (valid)
      AMEX: 378282246310005        (valid)
      Discover: 6011111111111117   (valid)
      MasterCard: 5105105105105100 (valid)
      MasterCard: 5105105105105106 (invalid)
      Unknown: 9111111111111111    (invalid)
    EOL

    expect(credit_cards.to_s.split("\n").first).to eq formatted_credit_cards.split("\n").first
    expect(credit_cards.to_s.split("\n").last).to eq formatted_credit_cards.split("\n").last.strip
    expect(credit_cards.to_s.split("\n")).to eq formatted_credit_cards.split("\n").map(&:strip)

  end
end
