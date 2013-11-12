json.array!(@users) do |user|
  json.extract! user, :login, :full_name, :birth_day, :email, :address, :city, :state, :country, :zip, :password, :confirm_password
  json.url user_url(user, format: :json)
end
