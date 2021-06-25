json.array! @styles do |style|
  json.extract! style, :id, :name, :description
end
