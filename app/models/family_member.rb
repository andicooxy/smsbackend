class FamilyMember < ApplicationRecord
  has_many :student_family_members
  has_many :students, through: :student_family_members

  has_many :telephones 
  has_many :emails 
  belongs_to :occupation, optional: true  
end
