json.array! @programminglogs do |prolog|
  json.id prolog.id
  json.title prolog.title
  json.text prolog.text
  json.image prolog.image
  json.user_id prolog.user_id
  json.name prolog.user.name
  json.user_sign_in current_user
end