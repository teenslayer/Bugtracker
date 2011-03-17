namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    
    # Step 1: clear any old data in the db
    [Assignment, Defect, Note, Project, Source, User].each(&:delete_all)
    
    # Step 2: add some sources to work with (small set for now...)
    sources = %w[Code Documentation Requirements Design]
    sources.sort.each do |source|
      s = Source.new
      s.name = source
      s.save!
    end
    
    # Step 3: add some projects to work with (just six for now)
    projects = %w[BookManager ChoreTracker Proverbs Arbeit Creamery Friends]
    projects.each do |project|
      p = Project.new
      p.name = project
      started = rand(4) + 2
      ends = rand(3) + 3
      p.start_date = started.months.ago
      p.end_date = ends.months.from_now
      p.save!
    end
    
    # Step 4: add Prof. H as a faculty member
    u = User.new
    u.first_name = "Professor"
    u.last_name = "Heimann"
    u.email = "profh@cmu.edu"
    u.username = "profh"
    u.password = "star_tr3k"
    u.password_confirmation = "star_tr3k"
    u.active = true
    u.is_faculty = true
    u.save!
    
    # Step 4: add 20 students to the system and assign to projects
    User.populate 20 do |user|
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.email = Faker::Internet.email
      user.username = "#{user.first_name}_#{user.last_name}"
      user.crypted_password = rand(10**10).to_s.rjust(10,'0')
      user.active = true
      user.is_faculty = false
      user.created_at = Time.now
      user.updated_at = Time.now
      
      # Step 4A: assign 1 to 3 projects for each student
      Assignment.populate 1..3 do |assignment|
        assignment.user_id = user.id
        assignment.project_id = Project.all.map{|p| p.id}
        manager_chance = rand(5)
        if manager_chance.zero?
          assignment.role = "manager"
        else
          assignment.role = "member"
        end
        assignment.created_at = Time.now
        assignment.updated_at = Time.now
      end  
    end
    
    # Step 5: add some bugs and assign them to projects
    Defect.populate 100 do |bug|
      bug.project_id = Project.all.map{|p| p.id}
      bug.source_id = Source.all.map{|s| s.id}
      bug.summary = Faker::Company.catch_phrase
      bug.details = Faker::Lorem.paragraph
      bug.created_at = 1.month.ago..2.days.ago # date range can differ
      
      # technically, this could lead to someone reporting a bug for 
      # a project they are not a member of ... don't expect them to
      # have a named_scope to make a better draw so this is okay.
      bug.reporter_id = User.all.map{|u| u.id}
      # better is: bug.resolver_id = User.all.for_project(bug.project_id).map{|u| u.id}
      
      unless rand(9).zero?
        # same note as above on users resolving bugs...
        bug.resolver_id = User.all.map{|u| u.id}
        # better: bug.resolver_id = User.all.for_project(bug.project_id).map{|u| u.id}
      end
      bug.severity = %w[trivial minor major critical]
      if rand(3).zero?
        bug.status = "fixed"
        bug.resolved_at = 2.days.ago..Time.now
      else
        bug.status = "open"
      end
    end  
  end
end
