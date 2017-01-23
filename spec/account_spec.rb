require 'account'

describe Account do

  let!(:account) { described_class.new(balance: 1000) }

  it 'should initialize with a default balance of zero' do
    empty_account = Account.new({})
    expect(empty_account.balance).to eq 0
  end

  it 'should be possible to initialize an account with a balance' do
    expect(account.balance).to eq 1000
  end

end
