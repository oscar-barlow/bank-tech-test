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
      expect(transaction_spy).to have_received(:new).with(amount: 100, date: Date.today, account_balance: 900)
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
      expect(transaction_spy).to have_received(:new).with(amount: 500, date: Date.today, account_balance: 1500)
    end

  end

end
