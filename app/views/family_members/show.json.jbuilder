json.key_format! camelize: :lower

json.family_member do
  json.id @family_member.id
  json.created_on @family_member.created_at
  json.firstname @family_member.firstname
  json.othername @family_member.othername
  json.surname @family_member.surname
  json.reference @family_member.reference
end
