class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_by_name(search_term)
    where("name LIKE ?", "%#{search_term}")
  end
  
end
