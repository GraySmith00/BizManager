json.extract! event, :id, :name, :date, :promoter, :paid, :created_at, :updated_at
json.url event_url(event, format: :json)
