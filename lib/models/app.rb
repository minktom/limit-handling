class App
  PUBLIC = :public
  PRIVATE = :private
  attr_reader :owner, :privacy

  def initialize(owner, privacy)
    raise ArgumentError.new("privacy is not allowed") unless [PUBLIC, PRIVATE].include? privacy
    @owner = owner
    @privacy = privacy
  end

  def convert_to_private!
    @privacy = PRIVATE
  end

  def limits
    case privacy
      when PRIVATE then PrivateAppLimitRetrievalStrategy.new(self).limits
      when PUBLIC then PublicAppLimitRetrievalStrategy.new(self).limits
    end
  end
end
