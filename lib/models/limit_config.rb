class LimitConfig
  attr_reader :concurrent_builds, :build_timeout_mins, :builds_per_month, :team_members

  def initialize(concurrent_builds, build_timeout_mins, builds_per_month, team_members)
    @concurrent_builds = concurrent_builds
    @build_timeout_mins = build_timeout_mins
    @builds_per_month = builds_per_month
    @team_members = team_members
  end
end