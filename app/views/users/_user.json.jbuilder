json.extract! user, :id, :email, :text, :password, :text, :created_at, :updated_at
json.url user_url(user, format: :json)
