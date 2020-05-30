class PublicAppLimitRetrievalStrategy
  def initialize(app)
    @app = app
  end

  def limits
    LimitsRepository.fetch PUBLIC_APP_DEFAULTS
  end
end