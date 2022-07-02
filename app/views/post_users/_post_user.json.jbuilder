json.extract! post_user, :id, :content, :created_at, :updated_at
json.url post_user_url(post_user, format: :json)
