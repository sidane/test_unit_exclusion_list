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
  
  test "Exception is raised when path to exclusion list is not provided" do
    assert_raise ArgumentError, "Please specify path to exclusion list - acts_as_test_exclusion_list(:exclusion_list_path => '/path/to/file')" do
      class AnotherMockTesterSubclass < MockTester
        acts_as_test_exclusion_list
      end
    end
  end

end
