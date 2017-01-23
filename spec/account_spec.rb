require 'account'

describe Account do

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

    it 'should be possible to withdraw money' do
      account.withdraw(100)
      expect(account.balance).to eq 900
    end

  end

  describe '#deposit' do

    it 'should be possible to deposit money' do
      account.deposit(500)
      expect(account.balance).to eq 1500
    end

  end

end
