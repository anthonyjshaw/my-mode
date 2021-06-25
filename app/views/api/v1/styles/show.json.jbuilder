json.extract! @style, :id, :name, :description
json.items @style.items do |item|
  json.extract! item, :id, :name, :color, :description, :clothes_type, :size
end
