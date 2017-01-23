class Transaction

  attr_reader :amount

  def initialize(args)
    @amount = args[:amount]
  end
end
