require 'statement_formatter'

describe StatementFormatter do

  let!(:deposit) { double(credit: 1000.00, debit: nil, date: Date.new(2012,1,10), account_balance: 1000.00) }
  let!(:big_deposit) { double(credit: 2000.00, debit: nil, date: Date.new(2012,1,13), account_balance: 3000.00) }
  let!(:withdrawal) { double(credit: nil, debit: 500.00, date: Date.new(2012,1,14), account_balance: 2500.00) }

  let!(:transactions) {[deposit, big_deposit, withdrawal]}

  let!(:statement) {described_class.new(transactions)}

  it 'should initialize with an array of transactions' do
    expect(statement.transactions).to_not be_empty
  end

  it 'should sort the transactions reverse chronologically' do
    expect(statement.sort_transactions[0]).to eq withdrawal
  end

end
