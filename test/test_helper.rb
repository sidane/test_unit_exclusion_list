require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/test_case'
require File.dirname(__FILE__) + '/../lib/test_unit_exclusion_list'

class MockTester
  
  attr_accessor :method_name
  
  def initialize(name)
    self.method_name = name
  end
  
end

class MockTesterSubclass < MockTester
  
  acts_as_test_exclusion_list(
    :exclusion_list_path => File.expand_path(File.dirname(__FILE__) + "/sample_exclusion_list.yml")
  )
  
end
