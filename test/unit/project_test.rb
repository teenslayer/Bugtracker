require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should_belong_to :defect
  should_belong_to :user
  
  #validations
  should_validate_presence_of :defect_id, :user_id
  
end
