class Decision < ApplicationRecord
    has_many :user_decisions, dependent: :destroy
    has_many :user, through: :user_decisions
    has_many :decision_futurs, dependent: :destroy
    has_many :futur, through: :decision_futurs
    belongs_to :theme
    
    validates :titre, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    validates :futur_ids, presence: true
end
