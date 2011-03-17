class Defect < ActiveRecord::Base
  #relationships
  belongs_to :source
  belongs_to :user
  belongs_to :project
  has_many :notes
  
  #validations
  validates_presence_of :project_id, :summary, :details, :reporter_id, :source_id, :severity, :status
  
  #named_scopes
  named_scope :all, :order => :summary
  named_scope :open_bug, :order => :summary, :conditions => ["status = ?", "open"]
  named_scope :new_bug, lambda {|created_at| {:conditions => ['created_at > ?', 5.days.ago], :order => 'created_at DESC'}} 
  
  
end
