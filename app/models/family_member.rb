class FamilyMember < ApplicationRecord
  has_many :students, through: :student_family_members
end
