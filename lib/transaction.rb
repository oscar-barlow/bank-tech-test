class Transaction

  attr_reader :amount, :date

  def initialize(args)
    @amount = args[:amount]
    @date = args[:date]
  end
end
