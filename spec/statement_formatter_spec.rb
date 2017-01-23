require 'statement_formatter'

describe StatementFormatter do

  let!(:deposit) { double(credit: 1000.00, debit: nil, date: Date.new(2012,1,10), account_balance: 1000.00) }
  let!(:big_deposit) { double(credit: 2000.00, debit: nil, date: Date.new(2012,1,13), account_balance: 3000.00) }
  let!(:withdrawal) { double(credit: nil, debit: 500.00, date: Date.new(2012,1,14), account_balance: 2500.00) }

  let!(:transactions) {[deposit, big_deposit, withdrawal]}

  let!(:statement) {described_class.new(transactions)}

  describe '#initialize' do
    it 'should initialize with an array of transactions' do
      expect(statement.transactions).to_not be_empty
    end
  end

  describe '#sort_transactions' do

    it 'should sort the transactions reverse chronologically' do
      expect(statement.sort_transactions[0]).to eq withdrawal
    end

  end

  describe '#print' do

    it 'should print the formatted transaction data' do
      expect(statement.print).to eq "date       || credit || debit   || balance\n14/01/2012 ||        || 500.00  || 2500.00 \n13/01/2012 || 2000.00||         || 3000.00 \n10/01/2012 || 1000.00||         || 1000.00 \n"
    end

  end

end
