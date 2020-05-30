require 'spec_helper'

describe PublicAppLimitRetrievalStrategy do
  subject(:strategy) { described_class.new app }
  let(:app) { App.new :irrelevant, App::PUBLIC }

  describe "#limits" do
    let(:public_app_default_limits) { instance_double LimitConfig }

    it "returns with the public app default limits" do
      allow(LimitsRepository).to receive(:fetch).with(PUBLIC_APP_DEFAULTS).and_return public_app_default_limits
      expect(strategy.limits).to eq public_app_default_limits
    end
  end
end