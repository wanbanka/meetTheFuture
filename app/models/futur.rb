class Futur < ApplicationRecord
   
    has_many :decision
    
    validates :titre, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
end
