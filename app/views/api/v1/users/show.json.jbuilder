json.extract! @user, :id, :username, :first_name, :last_name
json.styles @user.styles do |style|
  json.extract! style, :id, :name, :description
end
