require 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(args)
    @balance = args.fetch(:balance, 0)
    @transactions = []
  end

  def withdraw(amount, transaction_klass)
    self.balance -= amount
    create_transaction(amount, transaction_klass)
  end

  def deposit(amount)
    self.balance += amount
  end

  def create_transaction(amount, transaction_klass)
    transaction = transaction_klass.new(amount: amount, date: Date.today, account_balance: self.balance)
    self.transactions << transaction
  end

  private
    attr_writer :balance, :transactions

end
