json.key_format! camelize: :lower

json.family_members @family_members do |family_member|
  json.id family_member.id
  json.reference family_member.reference
  json.othername family_member.othername
  json.firstname family_member.firstname
  json.surname family_member.surname
  json.nationality family_member.nationality
  json.recidence_address family_member.recidence_address
  json.telephones family_member.telephones
  json.emails family_member.emails
  json.created_on family_member.created_at
  if  family_member.students
    json.students family_member.students do |student|
      json.id student.id
      json.firstname student.firstname
      json.age student.age
      json.date_of_birth student.dob
      json.surname student.surname
      json.othername student.othername
      json.created_on student.created_at
      json.profile_picture student.profile_picture
      json.enrollment_status student.enrollment_status
      json.status student.status
      json.level do
        json.id student&.level&.id
        json.name student&.level&.name
      end
    end
  else 
    json.students []
  end
  json.occupation family_member.occupation
end

json.total @family_members.count
