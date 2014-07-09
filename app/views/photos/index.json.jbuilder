json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :roll_call_id, :time, :location
  json.url photo_url(photo, format: :json)
end
