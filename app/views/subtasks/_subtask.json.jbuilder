json.extract! subtask, :id, :body, :created_at, :updated_at
json.url subtask_url(subtask, format: :json)
