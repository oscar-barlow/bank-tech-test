require 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(args)
    @balance = args.fetch(:balance, 0).to_f
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

  def statement
    statement = "date       || credit || debit   || balance\n"

    transactions.each do |transaction|
      line = ""
      if transaction.type == :credit
        line += "#{transaction.date.strftime('%d/%m/%Y')} || #{transaction.amount}||         || #{transaction.account_balance}\n"
      else
        line += "#{transaction.date.strftime('%d/%m/%Y')} ||         || #{transaction.amount}|| #{transaction.account_balance}\n"
      end
      statement += line
    end

    statement
  end

  private
    attr_writer :balance, :transactions

end
