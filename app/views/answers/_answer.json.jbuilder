json.extract! answer, :id, :body, :created_at, :updated_at
json.url answer_url(answer, format: :json)
json.body answer.body.to_s
