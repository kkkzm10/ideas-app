class Idea < ApplicationRecord
  belongs_to :category

  validates :body, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' }
end
