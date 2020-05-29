require "spec_helper"

RSpec.describe App do
  subject(:app) { described_class.new user }
  let(:user) { User.new plan }
  let(:plan) { Plan.new "Some plan" }

  describe "#owner" do
    subject { app.owner }
    it { is_expected.to eq user }
  end
end