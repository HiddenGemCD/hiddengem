json.lists do
    json.array! @lists do |list|
       json.extract! list, :id, :name

    end
    json.array! @cards
end
