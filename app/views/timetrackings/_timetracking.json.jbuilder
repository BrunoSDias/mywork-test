json.extract! timetracking, :id, :latitude, :longitude, :duration, :checkout, :created_at, :updated_at
json.url timetracking_url(timetracking, format: :json)
