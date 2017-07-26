json.extract! room, :id, :stream_url, :room_name, :created_at, :updated_at
json.url room_url(room, format: :json)