require 'spec_helper'

describe PublicAppLimitRetrievalStrategy do
  subject(:strategy) { described_class.new app }
  let(:app) { App.new :irrelevant, App::PUBLIC }

  describe "#limits" do
    let(:public_app_default_limits) { LimitConfig.new 2, 45, nil, nil }

    it "returns with the public app default limits" do
      expect(strategy.limits).to eq public_app_default_limits
    end

    context "when app has custom limits" do
      before { LimitsRepository.store app, custom_limits }
      let(:custom_limits) { LimitConfig.new 5, 75, 1000, nil }

      it "returns with the custom limits" do
        expect(strategy.limits).to eq custom_limits
      end
    end
  end
end