json.array!(@groups) do |group|
  json.extract! group, :id, :name, :created, :last_activity
  json.url group_url(group, format: :json)
end
