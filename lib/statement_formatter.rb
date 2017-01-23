class StatementFormatter
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def sort_transactions
    self.transactions.sort_by { |transaction| transaction.date }.reverse
  end

end
