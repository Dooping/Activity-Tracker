json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :duration, :initialTime, :place, :gpx
  json.url activity_url(activity, format: :json)
end
