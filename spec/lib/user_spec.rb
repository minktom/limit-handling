require "spec_helper"

RSpec.describe User do
  subject(:user) { described_class.new plan }
  let(:plan) { Plan.new "Some plan" }

  describe "#plan" do
    subject { user.plan }
    it { is_expected.to eq plan }
  end
end