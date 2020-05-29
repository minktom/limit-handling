class App
  PUBLIC = :public
  PRIVATE = :private
  attr_reader :owner, :privacy

  def initialize(owner, privacy)
    raise ArgumentError.new("privacy is not allowed") unless [PUBLIC, PRIVATE].include? privacy
    @owner = owner
    @privacy = privacy
  end
end
