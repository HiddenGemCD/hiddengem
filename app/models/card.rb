class Card < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :category
  belongs_to :city
  belongs_to :tag
end
