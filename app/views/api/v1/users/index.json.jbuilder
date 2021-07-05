json.array! @users do |user|
  json.extract! user, :id, :username
  json.number_of_styles user.styles.count
end
