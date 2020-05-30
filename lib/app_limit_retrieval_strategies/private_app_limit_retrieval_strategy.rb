class PrivateAppLimitRetrievalStrategy
  def initialize(app)
    @app = app
  end

  def limits
    LimitsRepository.fetch @app.owner.plan
  end
end
