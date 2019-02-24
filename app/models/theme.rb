class Theme < ApplicationRecord
    validates :nom, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    validates :texte_depart, presence: true, length: {minimum: 5}
end
