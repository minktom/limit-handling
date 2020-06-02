require "spec_helper"

RSpec.describe LimitCalculator do
  let(:app) { App.new user, privacy }
  let(:user) { User.new plan }
  let(:plan) { DEVELOPER_PLAN }

  describe ".limits_for" do
    subject(:limits) { described_class.limits_for app }
    context "when app is private" do
      let(:privacy) { App::PRIVATE }
      let(:plan_limits) { LimitsRepository.fetch DEVELOPER_PLAN }

      it "returns with the owners plan limits" do
        expect(limits).to eq plan_limits
      end
    end

    context "when app is public" do
      let(:privacy) { App::PUBLIC }
      let(:public_app_default_limits) { LimitsRepository.fetch PUBLIC_APP_DEFAULTS }

      it "returns with the public app default limits" do
        expect(limits).to eq public_app_default_limits
      end
    end
  end
end
