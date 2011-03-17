class AddDefaultUser < ActiveRecord::Migration
  def self.up
    profh = User.new
    profh.username = "profh"
    profh.email = "profh@cmu.edu"
    profh.password = "startr3k"
    profh.password_confirmation = "startr3k"
    profh.first_name = "Larry"
    profh.last_name = "Heimann"
    profh.save!
  end

  def self.down
    profh = User.find(:all, :conditions => ["username = ?", "profh"])
    User.delete profh
  end
end
