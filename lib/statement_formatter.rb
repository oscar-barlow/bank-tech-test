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
      row = [format_date(transaction),
             credit_cell_creator(transaction),
             debit_cell_creator(transaction),
             format_balance(transaction),
             "\n"
            ]
      row = row.join
      statement += row
    end
    statement
  end

  private

  def credit_cell_creator(transaction)
    transaction.credit ? format_credit(transaction) : "        ||"
  end

  def debit_cell_creator(transaction)
    transaction.debit ? format_debit(transaction) : "         ||"
  end

  def format_date(transaction)
    "#{transaction.date.strftime("%d/%m/%Y")}".ljust(11) + "||"
  end

  def format_credit(transaction)
    amount = sprintf("%.2f", "#{transaction.credit}")
    "#{amount}".rjust(8) + "||"
  end

  def format_debit(transaction)
    amount = sprintf("%.2f", "#{transaction.debit}")
    " #{amount}".ljust(9) + "||"
  end

  def format_balance(transaction)
    amount = sprintf("%.2f", "#{transaction.account_balance}")
    " #{amount}".ljust(9)
  end

end
