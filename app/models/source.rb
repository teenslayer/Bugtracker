class Source < ActiveRecord::Base
  #relationships
  has_many :defect
  
  #validations
  validates_presence_of :name
end
