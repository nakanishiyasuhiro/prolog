json.array! @programminglogs do |prolog|
  json.id prolog.id
  json.title prolog.title
  json.text prolog.text
  json.image prolog.image.url
  json.user_id prolog.user_id
  json.created_at prolog.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.name prolog.user.name
  json.user_image prolog.user.image.url
  json.tags prolog.tags.first
  json.likes prolog.likes_count
  json.user_sign_in current_user
end