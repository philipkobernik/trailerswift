json.email @user.email
json.auth_token @user.auth_token
json.band_name @user.band_name

if @user.active_tour.present?
  json.active_tour do
    json.name @user.active_tour.name
    json.id @user.active_tour.id
  end
end

