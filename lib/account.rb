class Account
  attr_reader :balance

  def initialize(args)
    @balance = args.fetch(:balance, 0)
  end

end
