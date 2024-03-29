json.array!(@memberships) do |membership|
  json.extract! membership, :id, :user_id, :group_id, :owner, :joined
  json.url membership_url(membership, format: :json)
end
