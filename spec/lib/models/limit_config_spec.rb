require "spec_helper"

RSpec.describe LimitConfig do
  subject(:limit_config) { described_class.new 1,10,100,2 }

  describe "#concurrent_builds" do
    subject { limit_config.concurrent_builds }
    it { is_expected.to eq 1 }
  end

  describe "#build_timeout_mins" do
    subject { limit_config.build_timeout_mins }
    it { is_expected.to eq 10 }
  end

  describe "#builds_per_month" do
    subject { limit_config.builds_per_month }
    it { is_expected.to eq 100 }
  end

  describe "#team_members" do
    subject { limit_config.team_members }
    it { is_expected.to eq 2 }
  end
end