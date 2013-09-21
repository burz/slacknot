json.array!(@klasses) do |klass|
  json.extract! klass, :name
  json.url klass_url(klass, format: :json)
end
