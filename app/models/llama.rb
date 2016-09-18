class Llama < ApplicationRecord
  belongs_to :order, optional: true

  validates :name, :age, :weight_kg, :price_cents, :description, :photo_url,
    presence: true
end
