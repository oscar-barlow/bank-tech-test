class Account
  attr_reader :balance, :transactions

  def initialize(args)
    @balance = args.fetch(:balance, 0)
    @transactions = []
  end

  def withdraw(amount)
    self.balance -= amount
  end

  def deposit(amount)
    self.balance += amount
  end

  private
    attr_writer :balance

end
