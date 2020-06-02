require "spec_helper"

RSpec.describe "Basic use cases:", :type => :system do
  let(:user) { User.new DEVELOPER_PLAN }
  let(:owners_plan_limits) { LimitsRepository.fetch DEVELOPER_PLAN }

  it "create a user account on one of the plans" do
    user = User.new DEVELOPER_PLAN

    expect(user.plan.name).to eq "Developer plan"
  end

  it "create a public or private app for a user" do
    app = App.new user, App::PUBLIC

    expect(app.privacy).to eq :public
  end

  context "for a public app" do
    let(:app) { App.new user, App::PUBLIC }
    let(:custom_limits) { LimitConfig.new 6, 75, 2000, nil }

    it "set up custom limits" do
      LimitsRepository.store app, custom_limits

      expect(LimitCalculator.limits_for app).to eq custom_limits
    end

    it "opt out from the default public app limits (use the owner's plan instead)" do
      expect { app.convert_to_private! }.to change { LimitCalculator.limits_for app }.to owners_plan_limits
    end
  end

  describe "get the limits of an app" do
    context "when it is public" do
      let(:app) { App.new user, App::PUBLIC }
      let(:app_limits) { LimitCalculator.limits_for app }
      let(:public_app_default_limits) { LimitConfig.new 2, 45, nil, nil }

      it "returns the default public limits" do
        expect(app_limits).to eq public_app_default_limits
      end

      context "and has custom config" do
        before { LimitsRepository.store app, custom_limits }
        let(:custom_limits) { LimitConfig.new 5, 75, 1000, nil }

        it "returns the custom limits" do
          expect(app_limits).to eq custom_limits
        end
      end
    end

    context "when it is private" do
      let(:app) { App.new user, App::PRIVATE }
      let(:app_limits) { LimitCalculator.limits_for app }

      it "returns the limits of the app owner's plan" do
        expect(app_limits).to eq owners_plan_limits
      end
    end
  end
end