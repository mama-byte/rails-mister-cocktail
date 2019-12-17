class Ingredient < ApplicationRecord
  # before_destroy :ensure_no_children
  has_many :doses

  validates :name, presence: true, uniqueness: true
  has_many :ingredients, through: :doses
end
