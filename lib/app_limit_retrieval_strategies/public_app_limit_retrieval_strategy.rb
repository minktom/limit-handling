class PublicAppLimitRetrievalStrategy
  def initialize(app)
    @app = app
  end

  def limits
    custom_limits || public_app_dafault_limits
  end

  private

  def custom_limits
    LimitsRepository.fetch @app
  end

  def public_app_dafault_limits
    LimitsRepository.fetch PUBLIC_APP_DEFAULTS
  end
end