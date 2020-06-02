require 'spec_helper'

describe PrivateAppLimitRetrievalStrategy do
  subject(:strategy) { described_class.new app }
  let(:app) { App.new user, App::PRIVATE }
  let(:user) { User.new plan }
  let(:plan) { Plan.new "Some plan" }

  describe "#limits" do
    let(:plan_limits) { instance_double LimitConfig }

    it "returns with the public app default limits" do
      allow(LimitsRepository).to receive(:fetch).with(plan).and_return plan_limits
      expect(strategy.limits).to eq plan_limits
    end
  end
end