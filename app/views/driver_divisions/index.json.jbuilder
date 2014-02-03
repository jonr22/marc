json.array!(@driver_divisions) do |driver_division|
  json.extract! driver_division, :id, :name
  json.url driver_division_url(driver_division, format: :json)
end
