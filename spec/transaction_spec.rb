require 'transaction'

describe Transaction do

  let!(:day) {double("Day of the transaction")}
  let!(:transaction) { described_class.new({amount: 300, date: day}) }

  it 'should initialize with an amount' do
    expect(transaction.amount).to eq 300
  end

  it 'should initialize with a date' do
    expect(transaction.date).to eq day
  end

end
