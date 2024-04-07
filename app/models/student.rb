class Student < ApplicationRecord
  has_many :family_members, through: :student_family_members
  belongs_to :level, optional: true 
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
