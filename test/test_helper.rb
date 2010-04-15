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
  
  acts_as_test_exclusion_list
  
  def exclusion_list
    %w(test_to_be_excluded)
  end
  
end
