require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../../vendor/plugins/base/test/unit/base_carrier_test_module.rb'

class BaseCarrierTest < ActiveSupport::TestCase
  include BaseCarrierTestModule
  
  # You must write UnitTest!!
  def test_default
    assert true
  end
      
end
