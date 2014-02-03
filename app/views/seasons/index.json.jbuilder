json.array!(@seasons) do |season|
  json.extract! season, :id, :name
end
