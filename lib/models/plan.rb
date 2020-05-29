class Plan
  attr_reader :name, :limits

  def initialize(name, limits)
    @name = name
    @limits = limits
  end
end