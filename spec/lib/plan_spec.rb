require "spec_helper"

RSpec.describe Plan do
  subject(:plan) { described_class.new "Some plan", limit_config }
  let(:limit_config) { LimitConfig.new 2, 30, 200, 2 }

  describe "#name" do
    subject { plan.name }
    it { is_expected.to eq "Some plan" }
  end

  describe "#limits" do
    subject { plan.limits }
    it { is_expected.to eq limit_config}
  end
end