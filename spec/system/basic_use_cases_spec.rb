require "spec_helper"

RSpec.describe "Basic use cases:", :type => :system do
  let(:user) { User.new DEVELOPER_PLAN }
  let(:owners_plan_limits) { LimitsRepository.fetch DEVELOPER_PLAN }
  let(:public_app_default_limits) { }

  xit "create a user account on one of the plans" do
    user = User.new DEVELOPER_PLAN

    expect(user.plan.name).to eq "Developer plan"
  end

  xit "create a public or private app for a user" do
    app = App.new user, APP::PUBLIC

    expect(app.privacy).to eq :public
  end

  xcontext "for a public app" do
    let(:app) { App.new owner, APP::PUBLIC }
    let(:custom_limits) { LimitConfig.new 6,75,2000, nil }

    it "set up custom limits" do
      LimitsRepository.store app, custom_limits

      expect(app.limits).to eq custom_limits
    end

    it "opt out from the default public app limits (use the owner's plan instead)" do
      expect { app.convert_to_private! }.to change { app.limits }.to owners_plan_limits
    end
  end

  xdescribe "get the limits of an app" do
    context "when it is public" do
      let(:app) { app = App.new owner, APP::PUBLIC }
      it "shows the default public limits" do
        expect(app.limits).to eq public_app_default_limits
      end
    end

    context "when it is private" do
      let(:app) { app = App.new owner, APP::PRIVATE }

      it "shows the limits of the app owner's plan" do
        expect(app.limits).to eq owners_plan_limits
      end
    end
  end
end