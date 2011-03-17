require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should_have_many :defect
  
  #validations
  should_validate_presence_of :name
  
end
