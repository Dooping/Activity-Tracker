json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :email, :birth, :gender, :weight, :country, :info
  json.url profile_url(profile, format: :json)
end
