class Student < ApplicationRecord
  has_many :student_family_members
  has_many :family_members, through: :student_family_members
  
  belongs_to :level, optional: true 
  enum enrollment_status: %i[prospective onborded expelled]
  enum status: %i[not_set available_in_school not_in_school]

  def related_as(relative_id)
    StudentFamilyMember.find_by(student_id: id, 
      family_member_id: relative_id)&.relation_type&.name  || :unknown
  end

  def age
    return nil if dob.nil?

    # Calculate age based on the current date
    current_date = Time.zone.now.to_date
    age = current_date.year - dob.year

    # Adjust age if the birthday hasn't occurred yet this year
    age -= 1 if current_date < dob + age.years

    age
  end
end
