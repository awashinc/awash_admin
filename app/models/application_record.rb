class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def cret
    puts self.created_at.strftime("%Y%m%d")
  end

  def self.sample
    offset(rand(self.count)).first
  end
 
end
