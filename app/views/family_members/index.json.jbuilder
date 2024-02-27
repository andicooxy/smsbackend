json.key_format! camelize: :lower

json.family_members @family_members do |family_member|
  json.id family_member.id
  json.reference family_member.reference
  json.othername family_member.othername
  json.firstname family_member.firstname
  json.surname family_member.surname
  # json.phone family_member.phone
  # json.email family_member.email
  json.created_on family_member.created_at
  # json.occupation family_member.occupation
end

json.total @family_members.count
