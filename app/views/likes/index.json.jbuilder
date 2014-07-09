json.array!(@likes) do |like|
  json.extract! like, :id, :photo_id, :user_id, :time
  json.url like_url(like, format: :json)
end
