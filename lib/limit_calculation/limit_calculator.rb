class LimitCalculator
  def self.limits_for(app)
    case app.privacy
    when App::PRIVATE then PrivateAppLimitRetrievalStrategy.new(app).limits
    when App::PUBLIC then PublicAppLimitRetrievalStrategy.new(app).limits
    end
  end
end