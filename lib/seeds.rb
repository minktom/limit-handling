PUBLIC_APP_DEFAULTS = :public_app_defaults
LimitsRepository.store PUBLIC_APP_DEFAULTS, LimitConfig.new(2, 45, nil, nil)

FREE_PLAN = Plan.new "Free plan"
DEVELOPER_PLAN = Plan.new "Developer plan"
ORGANIZATION_PLAN = Plan.new "Organization plan"

LimitsRepository.store FREE_PLAN, LimitConfig.new(1, 10, 200, 2)
LimitsRepository.store DEVELOPER_PLAN, LimitConfig.new(2, 45, nil, nil)
LimitsRepository.store ORGANIZATION_PLAN, LimitConfig.new(4, 90, nil, nil)
