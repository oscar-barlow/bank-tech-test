require 'transaction'

describe Transaction do

  let!(:transaction) { described_class.new({amount: 300}) }

  it 'should initialize with an amount' do
    expect(transaction.amount).to eq 300
  end

end
