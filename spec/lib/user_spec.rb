require "spec_helper"

RSpec.describe User do
  subject(:user) { described_class.new plan }
  let(:plan) { Plan.new "Some plan", limit_config }
  let(:limit_config) { LimitConfig.new 2, 30, 200, 2 }

  describe "#plan" do
    subject { user.plan }
    it { is_expected.to eq plan }
  end
end