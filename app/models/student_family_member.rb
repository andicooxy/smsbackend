class StudentFamilyMember < ApplicationRecord
  belongs_to :student 
  belongs_to :family_member
  belongs_to :relation_type
end
