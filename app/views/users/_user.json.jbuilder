json.email @user.email
json.auth_token @user.auth_token
if @user.active_tour.present?
  json.active_tour do
    json.name @user.active_tour.name
    json.id @user.active_tour.id
  end
end

