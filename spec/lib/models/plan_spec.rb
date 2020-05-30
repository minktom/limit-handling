require "spec_helper"

RSpec.describe Plan do
  subject(:plan) { described_class.new "Some plan" }

  describe "#name" do
    subject { plan.name }
    it { is_expected.to eq "Some plan" }
  end
end