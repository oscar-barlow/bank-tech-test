require 'account'

describe Account do

  context 'account has no money' do

    let!(:empty_account) {described_class.new({}) }

    it 'should initialize with a default balance of zero' do
      expect(empty_account.balance).to eq 0
    end

  end

  context 'account has money' do

    let!(:account) { described_class.new(balance: 1000) }

    it 'should be possible to initialize an account with a balance' do
      expect(account.balance).to eq 1000
    end

    it 'should be possible to withdraw money' do
      account.withdraw(100)
      expect(account.balance).to eq 900
    end

  end

end
