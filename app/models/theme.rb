class Theme < ApplicationRecord
    
    belongs_to :futur, dependent: :destroy
    
    validates :nom, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    validates :futur_id, presence: true
end
