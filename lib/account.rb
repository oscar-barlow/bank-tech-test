class Account
  attr_reader :balance

  def initialize(args)
    @balance = args.fetch(:balance, 0)
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
