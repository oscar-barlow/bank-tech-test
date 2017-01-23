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

    it 'should have a balance stored as a float' do
      expect(account.balance).to be_a Float
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
      expect(transaction_spy).to have_received(:new).with(amount: 100, date: Date.today, account_balance: 900, type: :debit)
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
      expect(transaction_spy).to have_received(:new).with(amount: 500, date: Date.today, account_balance: 1500, type: :credit)
    end

  end

  describe '#statement' do

    let!(:deposit) { double(amount: 1000.00, date: Date.new(2012,1,10), account_balance: 1000.00, type: :credit) }
    let!(:big_deposit) { double(amount: 2000.00, date: Date.new(2012,1,13), account_balance: 3000.00, type: :credit) }
    let!(:withdrawal) { double(amount: 1000.00, date: Date.new(2012,1,14), account_balance: 2500.00, type: :debit) }

    let!(:busy_account) { described_class.new({}) }

    xit 'should output a nicely formatted statement' do
      busy_account.transactions.push(deposit, big_deposit, withdrawal)
      expect(busy_account.statement).to eq <<-STATEMENT
      date       || credit || debit   || balance
      14/01/2012 ||        || 500.00  || 2500.00
      13/01/2012 || 2000.00||         || 3000.00
      10/01/2012 || 1000.00||         || 1000.00
      STATEMENT
    end

  end

end
