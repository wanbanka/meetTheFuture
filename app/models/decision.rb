class Decision < ApplicationRecord
    has_many :user_decisions, dependent: :destroy
    has_many :user, through: :user_decisions
    belongs_to :theme, dependent: :destroy
    belongs_to :futur
    
    validates :titre, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    validates :second_futur, presence: true
    validates :futur_id, presence: true
end
