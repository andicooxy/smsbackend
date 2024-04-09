json.key_format! camelize: :lower

json.family_member do
  json.id @family_member.id
  json.firstname @family_member.firstname
  json.othername @family_member.othername
  json.surname @family_member.surname
  json.reference @family_member.reference
  json.nationality @family_member.nationality
  json.recidence_address @family_member.recidence_address
  json.telephones @family_member.telephones
  json.emails @family_member.emails
  json.created_on @family_member.created_at
  json.occupation @family_member.occupation
  if @family_member.students
    json.students @family_member.students do |student|
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
      json.related_as  student.related_as(@family_member.id)
    end
  else 
    json.students []
  end

end
