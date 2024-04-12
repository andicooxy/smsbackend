json.key_format! camelize: :lower

json.students do
  json.id @student.id
  json.age @student.age
  json.date_of_birth @student.dob
  json.created_on @student.created_at
  json.profile_picture @student.profile_picture
  json.firstname @student.firstname
  json.othername @student.othername
  json.surname @student.surname
  json.enrollment_status @student.enrollment_status
  json.status @student.status
  json.level do
    json.id @student&.level&.id
    json.name @student&.level&.name
  end

  if  @student.family_members
    json.relatives @student.family_members do |relative|
      json.id relative.id
      json.firstname relative.firstname
      json.surname relative.surname
      json.othername relative.othername
      json.created_on relative.created_at
      json.occupation relative.occupation
      json.telephones relative.telephones
      json.emails relative.emails
      json.related_as @student.related_as(relative.id)
      json.reference relative.reference
      json.recidence_address relative.recidence_address
      json.nationality relative.nationality
    end
  else 
    json.relatives []
  end
end
