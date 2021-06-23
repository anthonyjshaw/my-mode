json.array! @styles do |restaurant|
  json.extract! restaurant, :id, :name, :description
end
