require 'transaction'

describe Transaction do

  let!(:day) {double("Day of the transaction")}
  let!(:transaction) { described_class.new(amount: 300, date: day, account_balance: 700) }

  it 'should initialize with an amount' do
    expect(transaction.amount).to eq 300
  end

  it 'should initialize with a date' do
    expect(transaction.date).to eq day
  end

  it 'should initialize with the account balance' do
    expect(transaction.account_balance).to eq 700
  end

end
