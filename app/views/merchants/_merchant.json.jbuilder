json.extract! merchant, :id, :title, :description, :user_id, :fee, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
