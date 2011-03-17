class Assignment < ActiveRecord::Base
  #relationships
  belongs_to :user
  belongs_to :project
  
  #validations
  validates_presence_of :project_id, :user_id, :role
end
