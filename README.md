# Limit handling

## Requirements
- Ruby (2.7.1)
- Bundler for Ruby

## Prepare
```
bundle install
```

## Run test
```
bundle exec rspec
```

## How to start console?
```
irb -r ./lib/bootstrap.rb
```

## Here's an example of usage
```
user = User.new DEVELOPER_PLAN
app = App.new user, App::PUBLIC
app.limits
=> #<LimitConfig:0x00007fafed299060 @concurrent_builds=2, @build_timeout_mins=45, @builds_per_month=nil, @team_members=nil>
LimitsRepository.store app, LimitConfig.new(6, 75, 2000, nil)
=> #<LimitConfig:0x00007fafee077600 @concurrent_builds=6, @build_timeout_mins=75, @builds_per_month=2000, @team_members=nil>
app.limits
=> #<LimitConfig:0x00007fafee077600 @concurrent_builds=6, @build_timeout_mins=75, @builds_per_month=2000, @team_members=nil>
app.convert_to_private!
app.limits
=> #<LimitConfig:0x00007fafed298ef8 @concurrent_builds=2, @build_timeout_mins=45, @builds_per_month=nil, @team_members=nil>
```