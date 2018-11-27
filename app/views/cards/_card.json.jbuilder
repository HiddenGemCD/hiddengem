json.extract! card, :id, :name, :description, :user_id, :list_id, :category_id, :city_id, :tag_id, :created_at, :updated_at
json.url card_url(card, format: :json)
