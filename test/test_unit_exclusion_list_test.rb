require File.dirname(__FILE__) + '/test_helper'

class TestUnitExclusionListTest < ActiveSupport::TestCase
  
  test "Method in exclusion list is renamed" do
    tester = MockTesterSubclass.new("test_to_be_excluded")
    assert_equal "skip_test", tester.method_name
  end
  
  test "Method not in exclusion list is not renamed" do
    tester = MockTesterSubclass.new("test_not_to_be_excluded")
    assert_equal "test_not_to_be_excluded", tester.method_name
  end

end
