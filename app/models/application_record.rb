class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :unarchived, -> { where(archived: false)  }
  def self.generate_reference 
     code = DateTime.now.to_i.to_s
    if self.exists?(reference: code)
      self.generate_reference
    else 
      code 
    end
  end
end
