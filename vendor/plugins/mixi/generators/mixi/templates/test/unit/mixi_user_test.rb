require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../../vendor/plugins/mixi/test/unit/mixi_user_test.rb'

class MixiUserTest < ActiveSupport::TestCase
  include MixiUserTestModule
end