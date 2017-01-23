require 'account'

describe Account do

  let!(:account) { described_class.new({}) }

  it 'should initialize with a default balance of zero' do
    expect(account.balance).to eq 0
  end

  it 'should be possible to initialize an account with a balance' do
    positive_account = Account.new(balance: 1000)
    expect(positive_account.balance).to eq 1000
  end

end
