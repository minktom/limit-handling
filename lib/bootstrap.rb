$LOAD_PATH << File.dirname(__FILE__)
$LOAD_PATH.uniq!

require 'repository'
require 'repositories/limits_repository'

require 'models'
require 'limit_calculation'

require 'seeds'
