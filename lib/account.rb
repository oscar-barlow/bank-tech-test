require 'transaction'

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

  def statement

    sorted_transactions = self.transactions.sort_by { |transaction| transaction.date }.reverse

    statement = "date       || credit || debit   || balance\n"

    sorted_transactions.each do |transaction|
      row = []
      date = "#{transaction.date.strftime("%d/%m/%Y")}".ljust(11) + "||"
      row << date
      if transaction.credit
        amount = sprintf("%.2f", "#{transaction.credit}")
        credit = "#{amount}".rjust(8) + "||"
        row << credit
      else
        row << "        ||"
      end
      if transaction.debit
        amount = sprintf("%.2f", "#{transaction.debit}")
        credit = " #{amount}".ljust(9) + "||"
        row << credit
      else
        row << "         ||"
      end
      amount = sprintf("%.2f", "#{transaction.account_balance}")
      balance = " #{amount}".ljust(9)
      row << balance
      row << "\n"
      row = row.join
      statement += row
    end
    statement
  end

  private
    attr_writer :balance, :transactions

end
