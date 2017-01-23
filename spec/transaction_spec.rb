require 'transaction'

describe Transaction do

  let!(:day) { double("Day of the transaction") }
  let!(:transaction) { described_class.new(credit: 300, date: day, account_balance: 1300) }

  describe '#initialize' do

    it 'can initialize with a credit amount' do
      expect(transaction.credit).to eq 300
    end

    it 'can initialize with a debit amount' do
      debit_transaction = Transaction.new(debit: 400, date: day, account_balance: 600)
      expect(debit_transaction.debit).to eq 400
    end

    it 'should initialize with a date' do
      expect(transaction.date).to eq day
    end

    it 'should initialize with the account balance' do
      expect(transaction.account_balance).to eq 1300
    end

  end

end
