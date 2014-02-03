json.array!(@drivers) do |driver|
  json.extract! driver, :id, :first_name, :last_name
  json.url driver_url(driver, format: :json)
end
