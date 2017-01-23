class Transaction

  attr_reader :amount, :date, :account_balance

  def initialize(args)
    @amount = args[:amount]
    @date = args[:date]
    @account_balance = args[:account_balance]
  end
  
end
