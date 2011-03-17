class Project < ActiveRecord::Base
  #relationships
  has_many :assignments
  has_many :defects
  has_many :users, :through => :assignments
  
  #validations
  validates_presence_of :name, :start_date

  #named_scopes

  
  

  
end
