require "spec_helper"

RSpec.describe App do
  subject(:app) { described_class.new user, privacy }
  let(:user) { User.new plan }
  let(:plan) { Plan.new "Some plan", limit_config }
  let(:limit_config) { LimitConfig.new 2, 30, 200, 2 }
  let(:privacy) { App::PRIVATE }

  describe ".new" do
    it "raises an error on invalid privacy value" do
      expect { App.new user, :invalid }.to raise_error ArgumentError, "privacy is not allowed"
    end
  end

  describe "#owner" do
    subject { app.owner }
    it { is_expected.to eq user }
  end

  describe "#privacy" do
    subject { app.privacy }
    it { is_expected.to eq privacy }
  end
end