json.array!(@race_classes) do |race_class|
  json.extract! race_class, :id, :name
  json.url race_class_url(race_class, format: :json)
end
