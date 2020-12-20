class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def is_geographic?
    defined?(self.geometry) ? true : false
  end
end
