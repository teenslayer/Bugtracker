class Note < ActiveRecord::Base
  #relationships
  belongs_to :defect
  belongs_to :user
  
  #validations
  validates_presence_of :defect_id, :user_id
  
end
