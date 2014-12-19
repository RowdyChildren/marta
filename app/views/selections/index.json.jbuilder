json.array!(@selections) do |selection|
  json.extract! selection, :id, :station_name
  json.url selection_url(selection, format: :json)
end
