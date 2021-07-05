json.array! @styles do |style|
  json.extract! style, :id, :name, :description, :user_id
  json.extract! style.user, :username
end
