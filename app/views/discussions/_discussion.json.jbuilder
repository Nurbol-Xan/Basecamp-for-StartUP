json.extract! discussion, :id, :content, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
