# Ignore specific tests that are in an exclusion list
#
# This is to enable skipping of tests in plugins/engines 
# that don't apply due to app specific requirements
#
# Be sure to "require 'test_unit_exclusion_list'" in your test helper
# then call 'acts_as_test_exclusion_list' method in sub-class of ActiveSupport::TestCase
# or when over-riding ActiveSupport::TestCase
def acts_as_test_exclusion_list
  class_eval do
    
    def initialize(name)
      if exclusion_list.include?(name)
        name = "skip_test" # over-ride test name so that it doesn't run
      end
      super(name)
    end
    
    # over-ride this method to define your exclusion list
    # TODO - move defining of exclusion list to YAML config file
    def exclusion_list
      []
    end
    
  end
end
    