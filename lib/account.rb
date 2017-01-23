require 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(args)
    @balance = args.fetch(:balance, 0).to_f
    @transactions = []
  end

  def withdraw(amount, transaction_klass)
    self.balance -= amount
    create_transaction(amount, transaction_klass, :debit)
  end

  def deposit(amount, transaction_klass)
    self.balance += amount
    create_transaction(amount, transaction_klass, :credit)
  end

  def create_transaction(amount, transaction_klass, type)
    transaction = transaction_klass.new(amount: amount, date: Date.today, account_balance: self.balance, type: type)
    self.transactions << transaction
  end

  private
    attr_writer :balance, :transactions

end
