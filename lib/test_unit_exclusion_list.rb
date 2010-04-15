# Ignore specific tests that are in an exclusion list
# See README.rdoc for full usage instructions
require 'yaml'

def acts_as_test_exclusion_list(opts = {})
  
  set_exclusion_list_path(opts[:exclusion_list_path])

  class_eval do
    def initialize(name)
      if exclusion_list.include?(name)
        name = "skip_test" # over-ride test name so that it doesn't run
      end
      super(name)
    end
    
    def exclusion_list
      YAML.load(File.read(@@exclusion_list_path))
    end
  end
end

  private
  
  def set_exclusion_list_path(path)
    if path.nil?
      raise ArgumentError, 
      "Please specify path to exclusion list - acts_as_test_exclusion_list(:exclusion_list_path => '/path/to/file')"
    end
    @@exclusion_list_path = path
  end
    