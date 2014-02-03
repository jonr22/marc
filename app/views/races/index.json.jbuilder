json.array!(@races) do |race|
  json.extract! race, :id, :date, :venue, :notes, :season_id
  json.url race_url(race, format: :json)
end
