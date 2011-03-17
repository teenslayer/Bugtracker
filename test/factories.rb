# FACTORIES FOR Bugtracker

# Begin with the User class
  Factory.define :user do |u|
    # if we create multiple users, automatically add a incremented number
    # by using the sequence method since login must be unique
    u.sequence(:username) { |n| "fred_#{n}" }   
    # specify a default (and awesome) password
    u.password "fred_lives"  
    # copy the password (default or otherwise) for confirmation
    u.password_confirmation { |u| u.password }  
    # as above, automatically add a incremented number to email prefix
    u.sequence(:email) { |n| "fred#{n}@example.com" }
  end
  
 #this code interferes with script/server. I don't know how to fix it. =[
# # Create factory for Defect class
  # Factory.define :defect do |d|
    # # your code here
  # d.project_id = 2;
  # d.summary = "a: thisssss issss a defectttttttttttttttt";
  # d.details = "this is a testtttt for defectsssss";
  # d.reporter_id = 1;
  # d.source = "Design";
  # d.severity = "minor";
  # d.status = "open";
  # end

# # Create factory for Source class
  # Factory.define :source do |s|
    # # your code here
  # s.id = 2;
  # s.name = "Code";  
   # end


