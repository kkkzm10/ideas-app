class Idea < ApplicationRecord
  belongs_to :category, optional: true

  validates :body, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' }
end
