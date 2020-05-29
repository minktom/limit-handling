class User
  attr_reader :plan

  def initialize(plan)
    @plan = plan
  end

  def limits
    @plan.limits
  end
end
