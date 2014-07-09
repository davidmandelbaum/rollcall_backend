json.array!(@users) do |user|
  json.extract! user, :id, :phone_number, :password, :first_name, :last_name, :joined, :last_activity, :email, :UDID, :avatar
  json.url user_url(user, format: :json)
end
