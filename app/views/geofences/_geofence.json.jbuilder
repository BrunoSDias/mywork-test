json.extract! geofence, :id, :latitude, :longitude, :radius, :created_at, :updated_at
json.url geofence_url(geofence, format: :json)
