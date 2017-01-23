require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(args)
    @balance = args.fetch(:balance, 0)
    @transactions = []
  end

  def withdraw(amount, transaction_klass)
    self.balance -= amount
    create_transaction({debit: amount}, transaction_klass)
  end

  def deposit(amount, transaction_klass)
    self.balance += amount
    create_transaction({credit: amount}, transaction_klass)
  end

  def create_transaction(args, transaction_klass)
    transaction = transaction_klass.new(credit: args[:credit], debit: args[:debit], date: Date.today, account_balance: self.balance)
    self.transactions << transaction
  end

  def create_statement(statement_formatter_klass)
    statement_formatter_klass.new(self.transactions)
  end

  def print_statement(statement_formatter_klass)
    create_statement(statement_formatter_klass).print
  end

  private
    attr_writer :balance, :transactions

end
