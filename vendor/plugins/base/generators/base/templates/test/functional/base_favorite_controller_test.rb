require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../../vendor/plugins/base/test/functional/base_favorite_controller_test.rb'

class BaseFavoriteControllerTest < ActionController::TestCase
  include BaseFavoriteControllerTestModule
  
  # You must write UnitTest!!
  def test_default
    assert true
  end

end
