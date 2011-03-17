require 'test_helper'

class DefectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should_belong_to :source
  should_belong_to :user
  should_belong_to :project
  should_have_many :notes
  
  should_validate_presence_of :project_id, :summary, :details, :reporter_id, :source_id, :severity, :status
  
  context "Adding different defects" do
  setup do
     @defect1 = Factory.create(:defect, :summary => "this is a test summary for a test defect..")
     @defect2 = Factory.create(:defect, :project_id => 4)
     @defect3 = Factory.create(:defect, :reporter_id => 3)
     @source1 = Factory.create(:source, :name => "Code")
     @source2 = Factory.create(:source, :name => "Design")
     @source3 = Factory.create(:source, :id => 3)    
  end
  
   should "shows all the defects are listed here in the right order" do
    assert_equal 3, Defect.all.size
    assert_equal ["defect2", "defect3", "defect1"], Defect.all.map{|d| d.summary}
  end
  
  
  teardown do
      @defect1.destroy
      @defect2.destroy
      @defect3.destroy
      @source1.destroy
      @source2.destroy
      @source3.destroy
  end
end
