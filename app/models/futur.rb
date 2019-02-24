class Futur < ApplicationRecord
    has_many :decision_futurs, dependent: :destroy
    has_many :decision, through: :decision_futurs
    
    validates :titre, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    validates :decision_ids, presence: true
end
