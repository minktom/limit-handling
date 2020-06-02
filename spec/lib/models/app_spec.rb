require "spec_helper"

RSpec.describe App do
  subject(:app) { described_class.new user, privacy }
  let(:user) { User.new plan }
  let(:plan) { DEVELOPER_PLAN }
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

  describe "#convert_to_private!" do
    subject(:convert_to_private!) { app.convert_to_private! }

    context "when app is public" do
      let(:privacy) { App::PUBLIC }

      it "changes the privacy to private" do
        expect { convert_to_private! } .to change { app.privacy }.to App::PRIVATE
      end
    end
  end
end