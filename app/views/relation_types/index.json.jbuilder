json.key_format! camelize: :lower

json.students @relation_types do |relative|
  json.id relative.id
  json.name relative.name
end

json.total @relation_types.count
