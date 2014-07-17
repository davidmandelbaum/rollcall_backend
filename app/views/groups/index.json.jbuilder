json.array!(@groups) do |group|
  json.extract! group, :id, :name, :created_at, :last_activity
  json.url group_url(group, format: :json)
end
