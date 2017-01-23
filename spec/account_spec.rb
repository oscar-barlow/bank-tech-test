require 'account'

describe Account do

  let!(:account) { described_class.new({}) }

  it 'should initialize with a default balance of zero' do
    expect(account.balance).to eq 0
  end

end
