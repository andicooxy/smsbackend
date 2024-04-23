json.key_format! camelize: :lower

json.username @user.username
json.lastname @user.lastname
json.othername @user.othername
json.firstname @user.firstname
json.user_type  do 
  json.name @user&.user_type&.name 
  json.id @user&.user_type&.id 
end
json.email @user.email 
json.active @user.active 