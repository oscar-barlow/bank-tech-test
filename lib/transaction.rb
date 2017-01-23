class Transaction

  attr_reader :amount, :date, :account_balance, :type

  def initialize(args)
    @amount = args[:amount]
    @date = args[:date]
    @account_balance = args[:account_balance]
    @type = args[:type]
  end

end
