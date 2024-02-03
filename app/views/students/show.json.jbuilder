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
end
