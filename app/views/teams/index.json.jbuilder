json.array!(@teams) do |team|
  json.extract! team, :id, :name, :leader_id, :description, :sport_id, :profile_id
  json.url team_url(team, format: :json)
end
