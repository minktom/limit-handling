class Plan
  attr_reader :name, :limits

  def initialize(name, limits=nil)
    @name = name
    @limits = limits
  end
end