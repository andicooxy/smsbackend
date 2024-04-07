json.key_format! camelize: :lower

json.students @levels do |level|
  json.id level.id
  json.name level.name
end

json.total @levels.count
