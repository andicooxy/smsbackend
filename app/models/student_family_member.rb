class StudentFamilyMember < ApplicationRecord
  belongs_to :student 
  belongs_to :family_member
end
