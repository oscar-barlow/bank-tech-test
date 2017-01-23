require 'account'

describe Account do

  let!(:transaction_spy) { spy("A Transaction") }
  let!(:account) { described_class.new(balance: 1000) }

  describe '#initialize' do

    it 'initialize with a default balance of zero' do
      empty_account = Account.new({})
      expect(empty_account.balance).to eq 0
    end

    it 'should be possible to initialize an account with a balance' do
      expect(account.balance).to eq 1000
    end

    it 'should initialize with an empty transactions array' do
      expect(account.transactions).to be_empty
    end

  end

  describe '#withdraw' do

    before(:each) do
      account.withdraw(100, transaction_spy)
    end

    it 'should be possible to withdraw money' do
      expect(account.balance).to eq 900
    end

    it 'should make a new entry in the transactions array' do
      expect(account.transactions.length).to eq 1
    end

    it 'should send transaction details to the transactions array' do
      expect(transaction_spy).to have_received(:new).with(credit: nil, debit: 100, date: Date.today, account_balance: 900.0)
    end

  end

  describe '#deposit' do

    before(:each) do
      account.deposit(500, transaction_spy)
    end

    it 'should be possible to deposit money' do
      expect(account.balance).to eq 1500
    end

    it 'should send transaction details to the transactions array' do
      expect(transaction_spy).to have_received(:new).with(credit: 500, debit: nil, date: Date.today, account_balance: 1500.0)
    end

  end

  context "getting account statements" do

    let!(:deposit) { double(credit: 1000.00, debit: nil, date: Date.new(2012,1,10), account_balance: 1000.00) }
    let!(:big_deposit) { double(credit: 2000.00, debit: nil, date: Date.new(2012,1,13), account_balance: 3000.00) }
    let!(:withdrawal) { double(credit: nil, debit: 500.00, date: Date.new(2012,1,14), account_balance: 2500.00) }

    let!(:formatter_spy) { spy("A formatter spy") }

    let!(:busy_account) { described_class.new({}) }

  describe '#create_statement' do

    it 'should create a new StatementFormatter object' do
      busy_account.transactions.push(deposit, big_deposit, withdrawal)
      busy_account.create_statement(formatter_spy)
      expect(formatter_spy).to have_received(:new).with(busy_account.transactions)
    end

  end

  describe '#print_statement' do

    it 'should send the print message to the statement formatter' do
      busy_account.transactions.push(deposit, big_deposit, withdrawal)
      busy_account.print_statement(formatter_spy)
      expect(formatter_spy).to have_received(:print)
    end

  end

end

end
