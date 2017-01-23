class StatementFormatter
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def sort_transactions
    self.transactions.sort_by { |transaction| transaction.date }.reverse
  end

  def print

    sorted_transactions = self.sort_transactions

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

end
