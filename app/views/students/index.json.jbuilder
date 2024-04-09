json.key_format! camelize: :lower

json.students @students do |student|
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
  # json.related_as student.related_as(relative.id)
  json.level do
    json.id student&.level&.id
    json.name student&.level&.name
  end

  # if student.incoming_call_manager
  #   json.incoming_call_manager do
  #     json.id student.incoming_call_manager.id
  #     json.name student.incoming_call_manager.name

  #     if student.incoming_call_manager.has_attribute? :handler
  #       json.handler student.incoming_call_manager.handler
  #     end
  #   end
  # end
end

json.total @students.count
