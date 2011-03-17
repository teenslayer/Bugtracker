require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should_belong_to :user
  should_belong_to :project
  
  should_validate_presence_of :project_id, :user_id, :role
end
