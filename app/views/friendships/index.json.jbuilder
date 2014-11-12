json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :email1, :email2, :accepted
  json.url friendship_url(friendship, format: :json)
end
