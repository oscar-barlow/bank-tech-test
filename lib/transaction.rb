class Transaction

  attr_reader :credit, :debit, :date, :account_balance, :type

  def initialize(args)
    @credit = args[:credit]
    @debit = args[:debit]
    @date = args[:date]
    @account_balance = args[:account_balance]
    @type = args[:type]
  end

end
